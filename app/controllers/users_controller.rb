class UsersController < ApplicationController
	def index

	end

	def new
		@user = RegisteredUser.new
	end

	def create
		@user = RegisteredUser.new(user_params)

		if @user.save
	      flash[:notice] = "You signed up successfully"
	      flash[:color]= "valid"

	      redirect_to :controller => 'users', :action => 'index'
	    else
	      flash[:notice] = "Form is invalid"
	      flash[:color]= "invalid"

	      render 'new'
	    end

	    
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
