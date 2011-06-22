class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :user_location
      t.string :post_location
      t.integer :accuracy
      t.integer :inaccuracy
      
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
