class AddPostsColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :topic, :string
    add_column :posts, :rate, :integer, default: 0
    add_column :posts, :age_restrict, :integer, default: 0
  end
end
