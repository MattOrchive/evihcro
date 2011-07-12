class ApplicationController < ActionController::Base
  protect_from_forgery
	
	before_filter :check_login, :only => :index
	
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
		posts_path
	end
	
	
	def check_login
		redirect_to posts_path if user_signed_in?
	end

end
