class Comment < ActiveRecord::Base
  belongs_to :post
	belongs_to :user
	
	comment_regex = /\A[a-zA-Z.\:\;, \/\'\"\(\)\{\}\[\]]+\z/
	
	
	validates :content, :presence => true,
	                    :length => {:within => 8..300},
	                    :format => {:with => comment_regex}
end