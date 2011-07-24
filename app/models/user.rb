class User < ActiveRecord::Base
  validate :check_beta_code, :on => 'create'
	
	has_and_belongs_to_many :roles
	has_many :comments
	
	has_many :posts, :dependent => :destroy
	
	
	def role?(role)
    self.role.to_sym == role.to_sym
  end
	  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
	attr_accessor :beta_code
  attr_accessible :beta_code, :email, :name, :password, :password_confirmation, :remember_me
	
	name_regex = /\A[a-zA-Z .-]+\z/
	
	validates :beta_code, :presence => true
	
	validates :name, :presence=> true,
									 :length => {:within => 5..25},
									 :format => {:with => name_regex }
	
	validates :password, :presence => true

  posts_upvoted_array = []
  posts_downvoted_array = []
  awards_array = []

  comments_upvoted_array = []
  comments_downvoted_array = []
	
	
	def check_beta_code
		beta_code_array = ['AAAAAAAAAA', 'BBBBBBBBBB', 'CCCCCCCCCC', 'DDDDDDDDDD', 'EEEEEEEEEE']
		
		unless beta_code_array.include?(beta_code)
			errors.add(:beta_code, "Invalid Beta Code")
		end
	end
end