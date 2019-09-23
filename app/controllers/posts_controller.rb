class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update]

	def index
		@posts = Post.all
		render :index
	end

	def show
		render :show
	end

	def new
		@post = Post.new
		render :new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save

	 	redirect_to posts_path(@post)
	end

	def edit
		render :edit
	end

	def update
	  @post.update(params_post)
	  redirect_to post_path(@post)
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def params_post
		params.require(:post).permit(:title, :description)
	end
end