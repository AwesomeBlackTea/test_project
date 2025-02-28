class AddUsersColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :surname, :string
    add_column :users, :phone, :string
    add_column :users, :active, :boolean, default: true
    add_column :users, :username, :string
    add_column :users, :bio, :text
  end
end
