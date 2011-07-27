class UsersController < ApplicationController
	def show
		@user_on_page = User.find(params[:id])
    @user = current_user
	end
end
