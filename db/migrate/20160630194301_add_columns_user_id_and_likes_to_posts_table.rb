class AddColumnsUserIdAndLikesToPostsTable < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :likes, :integer
  end
end