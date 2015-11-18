class SessionsController < ApplicationController

#render login form
	def new
	end

#login form data, parameters, create a new session
	def create
		#pass in login params
		#returns the user if correctly authenticated
		#store as a variable (user=)
	user = User.authenticate login_params['email'], login_params['password']
		#set truthy or falsey
	if user
			#grab id and store in session
		session[:user_id] = user.id
		flash[:success] = "#{user.email} has logged in successfully"
		redirect_to login_path

		else
			#give an error
		flash[:danger] = "Incorrect email and/or password"
		redirect_to login_path
	end
end

	#public method
	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end


	private

	#filter out parameters, inject data into model
	def login_params
		params.require(:user).permit(:email, :password)
	end
end
