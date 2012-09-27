class FollowsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    flash[:notice] = "Successfully unfollowed user."
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    flash[:notice] = "Successfully unfollowed user."
  end

end
