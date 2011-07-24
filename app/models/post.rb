 class Post < ActiveRecord::Base
	acts_as_taggable_on
	acts_as_taggable_on :tags
	
	belongs_to :user
	
	has_many :comments, :dependent => :destroy
	
#	attr_accessor :filter1, :filter2, :filter3, :filter4, :filter5, :filter6, :filter7, :filter8, :filter9, :filter10
	attr_accessor :politics, :tech, :entertainment, :sports, :science, :crime, :business, :social, :nature, :other
	attr_accessible :name, :title, :content, :user_location, :post_location, :user_id
	
	title_regex = /\A[a-zA-Z ,.-\/\[\]\{\}\'\"]+\z/

	validates :name, :presence => true
	
	validates :title, :presence => true,
										:length => {:within => 15..50},
									  :format => {:with => title_regex }
	
	validates :content, :presence => true,
											:length => {:within => 50..600}

   users_who_voted_up_array = []
   users_who_voted_down_array = []
	
end