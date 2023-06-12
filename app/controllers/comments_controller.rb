class CommentsController < ApplicationController

	def index
     @comments = Comment.all
	end

	def new
		@post = Post.find(params[:post_id])
      @comment = Comment.new
	end


	def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.new(comment_params)
       @comment.user = current_user

		if @comment.save
			redirect_to post_comments_path
		else
		    render new
		 end
	end


	def show
      @comment = current_user.comments
	end






private

   def comment_params
      params.require(:comment).permit(:comment, :user_id, :post_id)
   end
end
