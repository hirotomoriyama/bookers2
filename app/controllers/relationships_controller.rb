class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:id])
    redirect_back(fallback_location:root_path)
  end

  def follow_index
    @users = current_user.following_user
  end

  def follower_index
    @users = current_user.follower_user
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_back(fallback_location:root_path)
  end

end