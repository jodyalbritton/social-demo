class MailboxesController < ApplicationController
  def show
     @user = User.find(current_user)
     @messages = Recipient.where(:user_id => @user)
     @sent_messages = Message.where(:sender_id => @user.id)
     @notifications = Notification.where(:user_id => @user.id)
     @message = current_user.messages.build(params[:message])
  end
end
