class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.text :content
      
      t.references :post
      t.references :user

      t.integer :points_up
      t.integer :points_down
      t.decimal :relative_value

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
