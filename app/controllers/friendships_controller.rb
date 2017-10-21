class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save 
			flash[:notice] = "Added friend"
			redirect_to users_url
		else 
			flash[:error] = "Error to add friend"
			redirect_to users_url
		end
	end

	def destroy
		@friendship = current_user.friendships.find(param[:id])
		@friendship.destroy
		flash[:notice] = "Successful delete friend"
		redirect_to	users_url
	end
end
