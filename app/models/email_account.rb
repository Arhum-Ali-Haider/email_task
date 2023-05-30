class EmailAccount < ApplicationRecord
  require "net/imap"
  require 'net/smtp'
  has_many :emails

  validates :email, presence: true
  validates :password, presence: true
  validates :imap_server, presence: true

  enum :imap_servers, { 
    gmail: "imap.gmail.com",
    hotmail: "imap-mail.outlook.com",
    icloud: "imap.mail.me.com"
  }

  enum :smtp_servers, { 
    gmail_smtp: "smtp.gmail.com",
    hotmail_smtp: "smtp-mail.outlook.com",
    icloud_smtp: "smtp.mail.me.com"
  }

  def connect
    @connection = Net::IMAP.new(EmailAccount.imap_servers[imap_server.to_sym], imap_port,true)
    @connection.login(email, password)
  end

  def fetch_emails
    self.connect
    @connection.select('INBOX')
    ids = @connection.search('ALL')

    ids.each do |message_id|
        msg = @connection.fetch(message_id,'RFC822')[0].attr['RFC822']
        mail = Mail.read_from_string msg
        self.emails.create(email_id: mail.message_id, subject: mail.subject, body: mail&.text_part&.body || "")  unless self.emails.find_by(email_id: mail.message_id).present? 
    end
  end

  def smtp_connection
    @smtp = Net::SMTP.new(EmailAccount.smtp_servers["#{imap_server.to_sym}_smtp"], 587)
    @smtp.enable_starttls_auto
  end

  def send_email(to, subject, body)
    self.smtp_connection
    message = <<MESSAGE_END
From: #{email}
To: #{to}
MIME-Version: 1.0
Content-type: text/html
Subject: #{subject}
#{body}
MESSAGE_END

    @smtp.start(EmailAccount.smtp_servers["#{imap_server.to_sym}_smtp"], email, password, :login) do |smtp|
      @smtp.send_message(message, email, to)
    end

  end

end
