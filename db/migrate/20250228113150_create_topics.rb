class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :topic, :string

    create_table :topics do |t|
      t.string :name
      t.integer :age_restrict, default: 0

      t.timestamps
    end

    add_reference :posts, :topic, foreign_key: true
  end
end
