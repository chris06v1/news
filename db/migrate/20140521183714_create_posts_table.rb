class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :url
      t.text :body
      t.string :state

      t.timestamps
    end
  end
end
