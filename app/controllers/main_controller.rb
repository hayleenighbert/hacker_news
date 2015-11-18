class MainController < ApplicationController
	before_action :is_authenticated?
	#question mark is used in ruby to return a boolean value

  def index
  	# current_user
  	@posts = Post.all
  end

	def newpost
	# @tags = Tag.all
	@post = Post.new

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
