class Post < ActiveRecord::Base
	acts_as_commentable

	belongs_to :user
	has_many :comments
	
	default_scope -> { order(created_at: :desc) }
	validates :title, presence: true
	validates :description, presence: true
end
