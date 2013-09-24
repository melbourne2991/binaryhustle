class PostsController < ApplicationController
	helper_method :show, :display_replies

	# GET /posts
	# GET /posts.json
	def index
		@posts = Post.all
	end

	def show
		@post = Post.friendly.find(params[:id])

		@original_id = params[:original_id]

		@comment = Comment.new
		@user = User.new
	end
end