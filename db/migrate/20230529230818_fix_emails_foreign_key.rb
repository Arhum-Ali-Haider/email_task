class FixEmailsForeignKey < ActiveRecord::Migration[7.0]
  def change
      remove_foreign_key :emails, :email_accounts
      remove_index :emails, name: "index_emails_on_email_accounts_id"
      rename_column :emails, :email_accounts_id, :email_account_id
      add_foreign_key :emails, :email_accounts, column: :email_account_id
      add_index :emails, :email_account_id, name: "index_emails_on_email_account_id"
    end
   
end
