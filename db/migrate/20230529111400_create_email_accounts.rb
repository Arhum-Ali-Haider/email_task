class CreateEmailAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :email_accounts do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
