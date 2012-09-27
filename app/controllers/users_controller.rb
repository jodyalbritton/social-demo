class UsersController < ApplicationController


  before_filter :authenticate_user!

  def index
    @user = User.find(current_user)
    
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
     @followers = @user.followers
  end



 def edit
      @user = User.find(params[:id])
 end

 def update
   @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
        # Sign in the user bypassing validation in case his password changed
        sign_in @user, :bypass => true
        redirect_to root_path
    else
        render "edit"
    end
 end


end