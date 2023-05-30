class CreateEmail < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.belongs_to :email_accounts, foreign_key: true
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
