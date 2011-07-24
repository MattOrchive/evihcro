class AddFlaggedToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :flagged, :boolean, :default => false
  end

  def self.down
    remove_column :posts, :flagged
  end
end
