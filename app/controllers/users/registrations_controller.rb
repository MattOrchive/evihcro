class Users::RegistrationsController < Devise::RegistrationsController
	layout  "beta"
	
	before_filter :check_beta_code
	
	def check_beta_code
		#errors.add(:beta_code, 'Invalid Beta Code') if :beta_code != 'AAA'
	end
	
end