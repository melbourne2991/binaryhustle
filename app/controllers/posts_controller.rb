class PostsController < ApplicationController
	helper_method :show, :display_replies
	add_crumb "Blog", :posts_path

	# GET /posts
	# GET /posts.json
	def index
		@posts = Post.all
	end

	def show
		date = "#{params[:year]}-#{params[:month]}-#{params[:day]}"
		@post = Post.where(:slug => params[:slug], :date => date).first
		@disqus_id = "Post_" + @post.id.to_s

		add_crumb @post.title, post_path(@post.id)
	end

	def new
		@post = Post.new
	end

	def create
    	@post = Post.new(post_params)

	    respond_to do |format|
	        if @post.save
	            format.html { redirect_to @post, notice: 'Post was successfully created.' }
	            format.json { render action: 'show', status: :created, location: @post }
	        else
	            format.html { render action: 'new' }
	            format.json { render json: @post.errors, status: :unprocessable_entity }
	        end
	    end
  	end

	def meta

		meta_type = params[:meta_type]

		case meta_type
		when "user"
			@meta = User.find(params[:user_id])
			@meta_title = @meta.username + "'s Posts"
			@posts = Post.find(:all, :conditions => { :user_id => @meta.id})
		when "category"
			@meta = params[:category]
			@meta_title = @meta + " Posts"
			@posts = Post.find(:all, :conditions => { :category => @meta})
		when "date"
			@meta = Date.parse(params[:date])
			@meta_title = @meta.strftime("%d/%m/%Y") + " Posts"
			beginning_of_day = @meta.to_datetime.beginning_of_day
			end_of_day = @meta.to_datetime.end_of_day
			@posts = Post.where("created_at >= ?", beginning_of_day).where("created_at < ?", end_of_day).order(:created_at).all
		end

		add_crumb @meta_title, meta_path(params)

		rescue ActiveRecord::RecordNotFound
	  		render 'meta'
	end
end