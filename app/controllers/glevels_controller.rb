class GlevelsController < ApplicationController
  # GET /glevels
  # GET /glevels.json
  def index
    @glevels = Glevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glevels }
    end
  end

  # GET /glevels/1
  # GET /glevels/1.json
  def show
    @glevel = Glevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glevel }
    end
  end

  # GET /glevels/new
  # GET /glevels/new.json
  def new
    @glevel = Glevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glevel }
    end
  end

  # GET /glevels/1/edit
  def edit
    @glevel = Glevel.find(params[:id])
  end

  # POST /glevels
  # POST /glevels.json
  def create
    @glevel = Glevel.new(params[:glevel])

    respond_to do |format|
      if @glevel.save
        format.html { redirect_to @glevel, notice: 'Glevel was successfully created.' }
        format.json { render json: @glevel, status: :created, location: @glevel }
      else
        format.html { render action: "new" }
        format.json { render json: @glevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glevels/1
  # PUT /glevels/1.json
  def update
    @glevel = Glevel.find(params[:id])

    respond_to do |format|
      if @glevel.update_attributes(params[:glevel])
        format.html { redirect_to @glevel, notice: 'Glevel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glevels/1
  # DELETE /glevels/1.json
  def destroy
    @glevel = Glevel.find(params[:id])
    @glevel.destroy

    respond_to do |format|
      format.html { redirect_to glevels_url }
      format.json { head :no_content }
    end
  end
end
