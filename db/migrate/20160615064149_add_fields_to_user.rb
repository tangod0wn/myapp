class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :email_address, :string
    remove_column :users, :field, :string
  end
end
