class AddCommentsColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :title, :string
    add_column :comments, :rate, :integer, default: 0
  end
end
