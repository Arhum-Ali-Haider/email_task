class EmailAccountsController <  ApplicationController
  before_action :authenticate_user, except: [:new, :create]

  def index
    user = EmailAccount.find_by(email: session["current_user"]["email"])
    user.fetch_emails
    @emails = user.emails
  end

  def compose_email
    @email_account = EmailAccount.find_by(email: session["current_user"]["email"])
  end
  
  def send_email
    begin
      @email_account = EmailAccount.find_by(email: session["current_user"]["email"])
      @email_account.send_email(params[:email][:to], params[:email][:subject], params[:email][:body]) rescue ""
    rescue => e
      redirect_to compose_email_path, notice: e
    end
    redirect_to compose_email_path, notice: "Email sent successfully."
  end

  def new
    @email_account = EmailAccount.new
  end

  def create
    begin
      @email_account = EmailAccount.find_by(email: params[:email_account][:email])
      unless @email_account.present?
        @email_account = EmailAccount.new(account_params)
        redirect_to email_accounts_path, notice: "Couldn't log in email account " unless @email_account.save
      end
      @email_account.connect
      session[:current_user] = @email_account
      redirect_to email_accounts_path, notice: 'Email account logged in successfully.'
    rescue => exception
      redirect_to email_accounts_path, notice: exception
    end
    
  end

  def logout
    session[:current_user] = nil
    redirect_to new_email_account_path, notice: 'Logged out successfully.'
  end

  private
  
  def account_params
    {
      email: params[:email_account][:email],
      password: params[:email_account][:password],
      imap_server: params[:email_account][:imap_server],
      imap_port: 993,
      use_ssl: true
    }
  end

  def authenticate_user
    unless session[:current_user]
      redirect_to new_email_account_path, notice: 'Please log in to access this page.'
    end
  end

end
