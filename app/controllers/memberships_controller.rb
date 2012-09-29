class MembershipsController < ApplicationController
  # GET /memberships
  # GET /memberships.json
  def index
    @group = Group.find(params[:group_id])
    @memberships = @group.memberships.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @user = User.find(current_user)
    @membership = Membership.find(params[:id])
    @current_memberships = @user.memberships.where(:group_id => @group.id).count
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membership }
    end
  end

  # GET /memberships/new
  # GET /memberships/new.json
  def new
 
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.build
    
   
  end

  # GET /memberships/1/edit
  def edit
    @user = User.find(current_user)
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.find(params[:id])
    
     
 
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @group = Group.find(params[:group_id])
    @user = User.find(current_user)
    @current_memberships = @user.memberships.where(:group_id => @group.id).count
    
    if @current_memberships == 0
    @membership = current_user.memberships.build(:group_id => @group.id)
     if @group.privacy_level == 'PUBLIC'
        @membership.pending = 0
      elsif @group.privacy_level == 'RESTRICTED'
        @membership.pending = 1
      else
        raise "Cannot self-join a private group, you need to be invited"
      end
      @membership.save
    if @membership.save
       redirect_to :back
    end
    else 
    raise "Cannot join this group, you are already a member!"
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.json
  def update
    @user = User.find(current_user)
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.find(params[:id])
     redirect_to :back


      respond_to do |format|
      if @membership.update_attributes(params[:membership])
        format.html { redirect_to group_memberships_path, notice: 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
      end
   
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
   
    @membership = Membership.find(params[:id])
    @user = User.find(current_user)
    @membership.destroy
    if @membership.destroy
    redirect_to :back
    end
    
 end 
end
