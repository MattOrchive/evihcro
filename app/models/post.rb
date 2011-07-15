class Post < ActiveRecord::Base
	acts_as_taggable_on
	acts_as_taggable_on :tags
	
	belongs_to :user
	
	has_many :comments, :dependent => :destroy
	#has_one :tag
	
	attr_accessible :name, :title, :content, :user_location, :post_location, :user_id
	
	title_regex = /\A[a-zA-Z ,.-\/\[\]\{\}\'\"]+\z/

	validates :name, :presence => true
	
	validates :title, :presence => true,
										:length => {:within => 15..50},
									  :format => {:with => title_regex }
	
	validates :content, :presence => true,
											:length => {:within => 50..600}
	
end