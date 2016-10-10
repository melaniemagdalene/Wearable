class PostPolicy < ApplicationPolicy
	# Verifies user is owner of post
	def update?
		record.user_id == @user.id
	end

	def destroy?
		record.user_id == @user.id
	end
end
