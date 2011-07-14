class ApplicationController < ActionController::Base
  protect_from_forgery
	
	
	
	# Devise, way of using a different Layout for all the devise/non-signed in Views
#  layout :layout_by_resource
#  def layout_by_resource
#    if user_signed_in?
#      "application"
#    else
#      "beta"
#    end
#  end
	#rescue_from CanCan:AccessDenied do |e|
		#redirect_to root_url
	#end
	
	def after_sign_in_path_for(resource)
		posts_path
	end
	
	
	
end
