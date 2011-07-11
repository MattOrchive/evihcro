class ApplicationController < ActionController::Base
  protect_from_forgery
# before_filter :signed_in?
	
	# Devise, way of using a different Layout for all the devise/non-signed in Views
#  layout :layout_by_resource
#  def layout_by_resource
#    if user_signed_in?
#      "application"
#    else
#      "beta"
#    end
#  end
	
	
	
	
	def after_sign_in_path_for(resource)
		#posts_path
	end
	
#	def signed_in?
#		if user_signed_in? && request.path != '/posts'
#			
#		else
#			redirect_to 'beta_pages#index'				
#		end
#	end

end
