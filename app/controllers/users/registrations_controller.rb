class Users::RegistrationsController < Devise::RegistrationsController
	layout  "beta"
	
	def create
		build_resource

    if resource.save
			redirect_to '/thankyou'
			#sign_in_and_redirect(resource_name, resource)\
      #this commented line is responsible for sign in and redirection
      #change to something you want..
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
	end
	
end