class User < ActiveRecord::Base
  validate :check_beta_code
	  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
	attr_accessor :beta_code
  attr_accessible :beta_code, :email, :name, :password, :password_confirmation, :remember_me
	
	name_regex = /\A[a-zA-Z .-]+\z/
	
	validates :name, :presence=> true,
									 :length => {:within => 5..25},
									 :format => {:with => name_regex }
	
	validates :password, :presence => true
  
	
	
	def check_beta_code
		errors.add(:beta_code, "Invalid Beta Code") if :beta_code != 'AAA'
	end
end