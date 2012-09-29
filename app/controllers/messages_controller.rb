class MessagesController < ApplicationController
 

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    
  end

  # GET /messages/1/edit
  def edit
    @user = User.find(current_user)
    @message = @user.messages.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    
    @message = current_user.messages.build(params[:message])

  
      if @message.save
       
      flash[:notice] = "Message Sent"
      else 
      flash[:notice] = "Opps."
      end
   
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @user = User.find(current_user)
    @message = @user.messages.find(params[:id])

    
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @user = User.find(current_user)
    @message = @user.messages.find(params[:id])
    @message.destroy

  end
 
end
