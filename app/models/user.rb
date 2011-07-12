class User < ActiveRecord::Base
  validate :check_beta_code

  def check_beta_code
    errors.add(:beta_code, "incorrect beta code") if beta_code != 'code'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :beta_code, :email, :password, :password_confirmation, :remember_me
end
