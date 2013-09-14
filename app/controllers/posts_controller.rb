class PostsController < ApplicationController
	helper_method :show, :display_replies

	# GET /posts
	# GET /posts.json
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

end