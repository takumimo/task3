class RelationshipsController < ApplicationController

	def create
		following = current_user.follow(@user)
		following.save
		redirect_to request.referrer

	end

	def destroy
		following = current_user.unfollow(@user)
		following.destroy
		redirect_to request.referrer
	end

	private
	def
		@user = User.find(params[:relationship][:follow_id])
	end
end
