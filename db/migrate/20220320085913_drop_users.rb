class DropUsers < ActiveRecord::Migration[7.0]
  def change
    #remove_column :users, :reset_password_token
    #remove_column :users, :remember_created_at
    #remove_column :users, :reset_password_sent_at
    remove_index :users, column: :email
    remove_index :users, column: :reset_password_token
    #add_column :users, :created_at, :datetime, null: false
    #add_column :users, :updated_at, :datetime, null: false
  end
end
