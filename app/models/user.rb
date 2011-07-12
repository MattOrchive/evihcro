class User < ActiveRecord::Base
<<<<<<< HEAD
	before_filter :check_beta_code
	
=======
  validate :check_beta_code

  def check_beta_code
    errors.add(:beta_code, "incorrect beta code") if beta_code != 'code'

>>>>>>> 70cf8c451d969ffc3e038405005f602f36ac846a
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
<<<<<<< HEAD
  attr_accessible :email, :password, :password_confirmation, :remember_me, :beta_code
	
	def check_beta_code
		errors.add(:beta_code, "Invalid Beta Code") if beta_code != 'AAA'
	end
	
=======
  attr_accessible :beta_code, :email, :password, :password_confirmation, :remember_me
>>>>>>> 70cf8c451d969ffc3e038405005f602f36ac846a
end
