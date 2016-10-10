class StaticPagesController < ApplicationController
	after_action :verify_authorized, only: []

	def home
	end

	def posts
	end
end
