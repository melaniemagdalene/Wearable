class PostsController < ApplicationController
	before_action :correct_user, only: [:destroy]
	after_action :verify_authorized, only: [:update]


	# # Initializes new object, while passing two parameters
	# commentable = Post.create!(:title => "Title", :description => "Description")

	# comment = commentable.comments.create
	# comment.title = "First comment."
	# comment.comment = "This is the first comment."
	# comment.save


	def index
		@posts = policy_scope(Post)
		@posts = Post.all.order("created_at desc")
		@post = Post.new
	end

	def new
		if user_signed_in?
			@post = current_user.posts.new
		else
			redirect_to user_session_path
		end
	end

	def create
		# @post = Post.new post_params
		@post = current_user.posts.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new', notice: "Post was unable to save."
		end
	end

	def show
		@post = Post.find(params[:id])

		# comments = commentable.comments.recent.limit(10).all

		# first_comment = comments[1].comment

		# post = @post.id

		@comment = Comment.new
	end

	def edit
	end

	def update
		@post = Post.find(params[:id])
			authorize @post
		if @post.update_attributes(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	def publish
		@post = Post.find(params[:id])
		authorize @post, :update?
		@post.publish!
		redirect_to @post
	end

	def destroy
		# @post.destroy
		# redirect_to posts_path
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end


	def correct_user
		@post = current_user.posts.find_by(id: params[:id])
		redirect_to :back if @post.nil?
	end
end
