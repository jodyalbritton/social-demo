class ContactsController < ApplicationController
  
  def index
  @users = User.where("username like ?", "%#{params[:q]}%")
  respond_to do |format|
    format.html
    format.json { render :json => @users.collect {|user| {:id =>user.id, :name =>user.username } }}
  end
end


end
