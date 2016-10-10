class CommentsController < ApplicationController
	after_action :verify_authorized, only: []
	
	def new
		@comment = current_user.comments.new
		
	end

	def create
		# @post = Post.new post_params

		@post = params[:comment][:post_id]

		@comment = current_user.comments.new(
			post_id: @post,
			comment: params[:comment][:comment],
			user_id: current_user.id
			)

		@comment.save
		redirect_to :back
	end
end
