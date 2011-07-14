class User < ActiveRecord::Base
  validate :check_beta_code, :on => 'create'
	
	has_and_belongs_to_many :roles
	has_many :posts
	has_many :comments
	
	def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
	  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
	attr_accessor :beta_code
  attr_accessible :beta_code, :email, :name, :password, :password_confirmation, :admin, :remember_me
	
	name_regex = /\A[a-zA-Z .-]+\z/
	
	validates :beta_code, :presence => true
	
	validates :name, :presence=> true,
									 :length => {:within => 5..25},
									 :format => {:with => name_regex }
	
	validates :password, :presence => true
  
	
	
	def check_beta_code
		beta_code_array = ['AAAAAAAAAA', 'BBBBBBBBBB', 'CCCCCCCCCC', 'DDDDDDDDDD', 'EEEEEEEEEE']
		
		unless beta_code_array.include?(beta_code)
			errors.add(:beta_code, "Invalid Beta Code")
		end
	end
end