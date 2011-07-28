class UsersController < ApplicationController
  
  before_filter :authenticate_user!, :alert => 'You must be logged in to continue'
  
	def show
		@user_on_page = User.find(params[:id])
    @user = current_user
	end
end
