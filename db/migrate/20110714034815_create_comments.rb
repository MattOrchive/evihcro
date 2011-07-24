class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.text :content
      
      t.references :post
      t.references :user

<<<<<<< HEAD
      t.integer :points_up
      t.integer :points_down
      t.double :relative_value

=======
>>>>>>> 8f777215bdebd86f4816ad82260125b7888dbed2
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
