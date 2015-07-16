class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end
end
