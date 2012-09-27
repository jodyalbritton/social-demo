class ProfilesController < ApplicationController
  def show 
    @user = User.find(current_user)
    @profile = @user.profile
    
  end
  def edit
    @profile = current_user.profile
  end
  
  def create
    
    @profile = current_user.profile.build(params[:profile])
    if @profile.save
      if params[:profile][:avatar].present?
        render :crop
      else
        redirect_to user_path, notice: "Successfully created user."
      end
    else
      render :new
    end
  end


def update

    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      if params[:profile][:avatar].present?
        render :crop
      else
        redirect_to user_path(current_user), notice: "Successfully updated user."
      end
    else
      render :new
    end
  end
end