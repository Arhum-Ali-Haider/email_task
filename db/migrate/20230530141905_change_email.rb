class ChangeEmail < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :email_id, :string , null:false
  end
end
