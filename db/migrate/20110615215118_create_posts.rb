class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content

      t.string :user_location
      t.string :post_location

      t.integer :pageviews

      t.integer :accuracy
      t.integer :inaccuracy
			
			t.references :user
      
      t.integer :trending_value
      t.integer :accuracy_rating
			
      t.timestamps
    end
		add_index :posts, :user_id
  end

  def self.down
    drop_table :posts
  end
end
