class HomeController < ApplicationController
   before_filter :authenticate_user!

   
    def index
     @tags = Tag.all
     @tags.sort! {|x,y| y.trend_count <=> x.trend_count }
     @user = User.find(current_user)
     @scopes = current_user.circles.map { |r| [r.name, r.id] }
     @scopes.push(["Public", "0"])
     following = current_user.follows
     following_ids = following.collect{|f| f.followable_id}
     mycircles =  current_user.relationships.collect{|g| g.circle_id}
     mycircles.push(0)
     aoi = Activity.where(:target_type => ["Post"], :scope => mycircles).includes(:target, :user, :target => :user)
       
       if params[:tag]
        @tag = Tag.find(params[:tag])
        @activities = @tag.activities
       else 
        @activities = aoi.where(:user_id => [following_ids, current_user] ).page(params[:page])
       end
     
     
 
     @curr_membs = @user.memberships.includes(:group)
     @post = current_user.posts.build
   end
  
end
