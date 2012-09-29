class GroupsController < ApplicationController
  before_filter :load, :authenticate_user!
 
  
  def load
    @posts = Post.order("updated_at DESC")
    @post = Post.new
  end
  # GET /groups
  # GET /groups.json
  def index
    group_ids = current_user.memberships.collect{|g| g.group_id}
    @user = User.find(current_user)
    @groups = Group.all
    @my_groups = Group.where(:id => group_ids )
    
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @activities = @group.activities
 
    @current_memberships = current_user.memberships.where(:group_id => @group.id).count
    @new_membership = @group.memberships.build
    @user = User.find(current_user)
    @membership = @group.memberships.where(:user_id => current_user)
    @members = @group.memberships.find(:all)
    
    
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @user = User.find(current_user)
    @group = current_user.groups.build(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    if @group.user == current_user 
    @group.destroy
    else 
    raise "cannot"
    end

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
