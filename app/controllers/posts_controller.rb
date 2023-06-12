class PostsController < ApplicationController

	def new
       @post = current_user.posts.new
	end


	def create
       @post = current_user.posts.create(post_params)

       if @post.save
       	redirect_to post_path(@post)
       else
       	render new
       end
	end

	def show
    	@post = current_user.posts
	end


	def my_post
     @post = current_user.posts
	end



private
   
    def post_params
       params.require(:post).permit(:title, :content)
    end
end
