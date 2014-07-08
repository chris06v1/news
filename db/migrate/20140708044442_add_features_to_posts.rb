class AddFeaturesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :up_votes_count, :integer, :default => 0
    add_column :posts, :down_votes_count, :integer, :default => 0
    add_index :posts, :state
  end
end
