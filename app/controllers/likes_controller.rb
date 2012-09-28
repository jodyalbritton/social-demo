 class LikesController < ApplicationController

    def create
      target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])
      current_user.like!(target)
      @like_object = target.activities.first

     
    end

    def destroy
      target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])      
      current_user.unlike!(target)
      @like_object = target.activities.first

    end
  end
