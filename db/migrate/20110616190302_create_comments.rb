class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.date :date
      t.time :time
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
