class BetaPagesController < ApplicationController
	layout 'beta'
	
	before_filter :check_login, :only => :index
	
	def check_login
		redirect_to posts_path if user_signed_in?
	end

end
