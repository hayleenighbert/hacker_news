class PostsController < ApplicationController


before_action :is_authenticated?

	def index
		# current_user
	end

	def newpost
		# @post = Post.new
	end

	def createpost
		User.find_by_id(session[:user_id]).post.create createpost_params
		redirect_to root_path
	end

	private

	def createpost_params
		params.require(:user).permit(:title, :link)
	end
end

