class McategoriesController < ApplicationController
  before_filter :authenticate_user!
  # GET /mcategories
  # GET /mcategories.json
  def index
    @mcategories = Mcategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mcategories }
    end
  end

  # GET /mcategories/1
  # GET /mcategories/1.json
  def show
    @mcategory = Mcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mcategory }
    end
  end

  # GET /mcategories/new
  # GET /mcategories/new.json
  def new
    @mcategory = Mcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mcategory }
    end
  end

  # GET /mcategories/1/edit
  def edit
    @mcategory = Mcategory.find(params[:id])
  end

  # POST /mcategories
  # POST /mcategories.json
  def create
    @mcategory = Mcategory.new(params[:mcategory])

    respond_to do |format|
      if @mcategory.save
        format.html { redirect_to @mcategory, notice: 'Mcategory was successfully created.' }
        format.json { render json: @mcategory, status: :created, location: @mcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @mcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mcategories/1
  # PUT /mcategories/1.json
  def update
    @mcategory = Mcategory.find(params[:id])

    respond_to do |format|
      if @mcategory.update_attributes(params[:mcategory])
        format.html { redirect_to @mcategory, notice: 'Mcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mcategories/1
  # DELETE /mcategories/1.json
  def destroy
    @mcategory = Mcategory.find(params[:id])
    @mcategory.destroy

    respond_to do |format|
      format.html { redirect_to mcategories_url }
      format.json { head :no_content }
    end
  end
end
