class UsersController < ApplicationController
	layout 'beta', :except =>['show']
	
  def new
		@user = User.new
		@title = "Sign Up"
  end
	
	def show
		@user = User.find(params[:id])
		@title = @user.name
	end
	
	def create
		@user = User.new(params[:user])
		
		if @user.save
			redirect_to '/thankyou'
			Notifier.welcome(@user).deliver
		else
			@title = 'Sign Up'
			render 'new'
		end
	end
	
	def join
		@title = "Join Beta"
		
		
		#redirect_to '/signup' if @code == 'AAA'
		
		if %w('AAA').include?(params[:input])
			render 'new'
		else
			@title ='Enter Beta'
			render 'enter'
		end
		
	end
end