class CommentsController < ApplicationController
	def create
		@user = User.new(user_params)
		@post = Post.find(params[:post_id])

		respond_to do |format|
	      	if @user.save
	      		@comment = Comment.new(comment_params)
	      		@comment.user_id = @user.id
	      		@comment.post_id = params[:post_id]

	      		if @comment.save
	        		format.html { redirect_to @post, notice: 'Comment was successfully created.' }
	        	else
	        		format.html { redirect_to @post, notice: 'Comment was successfully created.' }
	        	end
		  	else
		   	 	format.html { redirect_to @post, notice: 'Comment was successfully created.' }
		  	end
		end

	end

	private
	def user_params
		params.require(:user).permit(:first_name, :email)
	end

	def comment_params
		params.require(:comment).permit(:content, :post_id, :original_id)
	end
end