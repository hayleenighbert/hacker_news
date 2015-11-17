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
end

