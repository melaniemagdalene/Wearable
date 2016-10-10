require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = Post.new(title: "Example Title", description: "Description")
	end

	test "should be valid" do
		assert @post.valid?
	end
end
