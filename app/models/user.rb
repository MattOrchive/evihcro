class User < ActiveRecord::Base
  #before_filter :check_beta_code
  
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
	

									 
	def check_beta_code 
    
  end
  
end