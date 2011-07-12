class User < ActiveRecord::Base
	before_filter :check_beta_code
	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :beta_code
	
	def check_beta_code
		errors.add(:beta_code, "Invalid Beta Code") if beta_code != 'AAA'
	end
	
end
