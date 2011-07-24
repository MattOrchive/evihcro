class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content

      t.string :user_location
      t.string :post_location

      t.integer :pageviews

      t.integer :accuracy #upvotes
      t.integer :inaccuracy #downvotes
			
			t.references :user
      
      t.double :trending_value #note: changed to double
      t.integer :accuracy_rating
			
      t.timestamps

      # Jon's code incoming
      t.double :karma
      t.integer :total_votes
      t.integer :time_effective #Relevant to trending value algo
      t.integer :post_id

    end
		add_index :posts, :user_id
  end

  def self.down
    drop_table :posts
  end
end
