class CreatePostsTopics < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :topic, foreign_key: true

    create_table :posts_topics, id: false do |t|
      t.references :post, null: false, foreign_key: { on_delete: :cascade }
      t.references :topic, null: false, foreign_key: { on_delete: :cascade }

      t.index [:post_id, :topic_id], unique: true
    end
  end
end
