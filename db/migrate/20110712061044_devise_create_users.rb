class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      #added by Jon
      t.integer :total_pageviews
      t.integer :total_comments_number
      t.integer :total_posts_number
      t.integer :total_upvotes
      t.integer :total_downvotes
      t.integer :reliability

      t.decimal :karma
      t.integer :comment_karma
      t.integer :newsworthiness #have users "level up" w/ more posts

      t.decimal :peak_hotness #how "hot" or "trendy" the user has ever gotten
      t.decimal :peak_accuracy
      t.decimal :peak_view_popularity
      t.decimal :peak_listeners #i.e. largest amount of people who voted on a submission you made

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
