class Comment < ActiveRecord::Base
  belongs_to :post
	belongs_to :user
	
	comment_regex = /\A[a-zA-Z.\:\;, \/\'\"\(\)\{\}\[\]]+\z/
	
	
	validates :content, :presence => true,
	                    :length => {:within => 8..300},
	                    :format => {:with => comment_regex}
<<<<<<< HEAD

   users_who_voted_up_array = []
   users_who_voted_down_array = []
=======
>>>>>>> 8f777215bdebd86f4816ad82260125b7888dbed2
end