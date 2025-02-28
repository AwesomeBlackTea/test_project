class ChangeUsersColumnsSettings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :username, false
    change_column_null :users, :email, false
    change_column_null :users, :phone, false
    change_column_null :users, :name, false
    change_column_null :users, :surname, false

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true

    change_column_null :posts, :title, false
  end
end
