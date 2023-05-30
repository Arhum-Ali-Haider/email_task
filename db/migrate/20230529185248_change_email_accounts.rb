class ChangeEmailAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :email_accounts, :imap_server, :string
    add_column :email_accounts, :imap_port, :integer
    add_column :email_accounts, :use_ssl, :boolean

  end
end
