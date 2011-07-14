class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.boolean :politics
      t.boolean :technology
      t.boolean :entertainment
      t.boolean :sports
      t.boolean :science
      t.boolean :crime
      t.boolean :business
      t.boolean :social
      t.boolean :nature
      t.boolean :other
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
