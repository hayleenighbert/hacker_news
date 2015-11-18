# class CommentsController < ApplicationController
# 	before_action :is_authenticated?
# 	# belongs_to :user
# 	# has_many :comments

# 	def index
# 	@comments = Comment.all
# 	end

# 	def newcomment
# 	# @tags = Tag.all
# 	@comment = Comment.new

# 	end


# 	def create

# 		comment = Post.find_by_id(params[:post_id]).comment.create comment_params
# 		current_user.comment << comment
# 		# puts Post.find_by_id([3])
# 		redirect_to root_path
# 	end

# 	def destroy
#     c = Comment.find params[:id]
#     c.delete
#     redirect_to post_comments_path(params[:post_id])
#   	end

# 	private

# 	def comment_params
# 		params.require(:comment).permit(:body)
# 	end

# end

class CommentsController < ApplicationController
  before_action :is_authenticated?, except: [:index]

  def index
    @post = Post.find params[:post_id]
  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    Comment.create comment_params do |c|
      c.post_id = params[:post_id]
      c.user_id = @current_user.id
      c.save
    end
    redirect_to post_comments_path(params[:post_id])
  end

  def destroy
    c = Comment.find params[:id]
    c.delete
    redirect_to post_comments_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
