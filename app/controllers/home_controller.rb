class HomeController < ApplicationController
   before_filter :load
    before_filter :authenticate_user!
  def load
  end
   
    def index
     @user = User.find(current_user)
     @scopes = current_user.circles.map { |r| [r.name, r.id] }
     @scopes.push(["Public", "0"])
     following = current_user.follows
     following_ids = following.collect{|f| f.followable_id}
     mycircles =  current_user.relationships.collect{|g| g.circle_id}
     mycircles.push(0)
     aoi = Activity.where(:target_type => ["Post", "Stat", "PhysicalActivity", "Meal", "MentalActivity"], :scope => mycircles).includes(:target, :user, :target => :user)
     @activities = aoi.where(:user_id => [following_ids, current_user] ).page(params[:page])
 
     @curr_membs = @user.memberships.includes(:group)
     @post = current_user.posts.build
     
   
     
   
 
  
    
  end
end
