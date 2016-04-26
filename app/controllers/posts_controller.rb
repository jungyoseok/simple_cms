class PostsController < ApplicationController
	layout 'public'
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@category = Category.all
	end

	def create
		@post = Post.new(user_params)
		
		if @post.save
			flash[:notice] = "Your post has been created"
			redirect_to posts_path
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(user_params)
			flash[:notice] = "Your post has been updated"
			redirect_to post_path
		else
			render "edit"
		end
	end

	

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice] = "Your post has been destroyed"
		redirect_to posts_path
	end

	private
	def user_params
      params.require(:post).permit(:title, :body, :category_id, :author_id)
    end
end
