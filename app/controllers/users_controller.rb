class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new, notice: "Thank you for registering!"
	end

	def show
	    @user = User.find(params[:id])
	end


	def create
		@user = User.new, notice: "Thank you for registering!"
		@user.save
	end

	def edit
	end
	

	def update
	end

	def destroy
	end
end
