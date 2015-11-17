class ApplicationController < ActionController::Base

	def is_authenticated?
		unless current_user
			flash[:danger] = 'invalid'
			redirect_to login_path
		end
	end

	def current_user
		@current_user ||= User.find_by_id(session[:user_id])
	end


    def new # render the signup form
        
    end

    def create # creates a new user in db
        User.create signup_params
        redirect_to root_path
    end

    private

    def signup_params
          params.require(:user).permit(:email, :password, :name)
   end

end