class PostsController < ApplicationController

  before_filter :load

  def load
    
   
    @post = Post.new
  end

  def index
     @user = User.find(current_user)
     @posts = @user.posts.order(:created_at)
     
  end
  
  def new
    @rtpost = Activity.find(params[:reply_to_id])
  end

  def create
  
 
    @post = current_user.posts.build(params[:post])
  
      
   
     respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Sucessfully created a Post!' }
        format.js   {
          
          if @post.parent_id == 0 
          following = Follow.where(["follower_id = ?", (current_user)])
          following_ids = following.collect{|f| f.followable_id}
          mycircles =  current_user.relationships.collect{|g| g.circle_id}
          mycircles.push(0)
          aoi = Activity.where(:target_type => ["Post"], :scope => mycircles )
          @activities = aoi.where(:user_id => [following_ids, current_user] ).page params[:page]
          flash[:notice] = "Successfully created post"
          flash.discard
          else 
           @group = Group.find(@post.parent_id)
           @activities = @group.activities.find(:all)
          end
        
   
        }
      else 
        
        format.js   {flash[:notice] = "Error"
          flash.discard }
          format.html { redirect_to root_path, notice: 'Errors prevented you from posting' }
          
     
      end
      end
    
    
    
  end

  def edit
    @post = Post.find(params[:id])
  end
  
 

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
        @posts = Post.order("updated_at DESC")
    end
  end
  
  def show 
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
     @posts = Post.order("updated_at DESC")
  end
end
