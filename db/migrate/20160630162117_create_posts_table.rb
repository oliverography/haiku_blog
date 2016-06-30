class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :line1
  		t.string :line2
  		t.string :line3
  		t.integer :user_id
  	end
  end
end
