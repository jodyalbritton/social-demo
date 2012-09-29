class CirclesController < ApplicationController
  # GET /circles
  # GET /circles.json
  def index
    @user = User.find(current_user)
    @circles = @user.circles.all
    @circle = current_user.circles.build(params[:circle])
  end

  # GET /circles/1
  # GET /circles/1.json
  def show
    @circle = Circle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @circle }
    end
  end

  # GET /circles/new
  # GET /circles/new.json
  def new
    @circle = Circle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @circle }
    end
  end

  # GET /circles/1/edit
  def edit
   
    @user = User.find(current_user)
     @circles = @user.circles
    @circle = @user.circles.find(params[:id])
  end

  # POST /circles
  # POST /circles.json
  def create
    @user = User.find(current_user)
    @circle = current_user.circles.build(params[:circle])

    respond_to do |format|
      if @circle.save
        format.html { redirect_to @circle, notice: 'Circle was successfully created.' }
        format.json { render json: @circle, status: :created, location: @circle }
        format.js { 
          @circles = @user.circles
          flash[:notice] = "Successfully created post" }
      else
        format.html { render action: "new" }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /circles/1
  # PUT /circles/1.json
  def update
    @circle = Circle.find(params[:id])

    respond_to do |format|
      if @circle.update_attributes(params[:circle])
        format.html { redirect_to @circle, notice: 'Circle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circles/1
  # DELETE /circles/1.json
  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy
    redirect_to circles_path
  end
end
