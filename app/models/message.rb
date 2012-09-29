class Message < ActiveRecord::Base
  attr_accessible :body, :sender_id, :subject, :user_tokens
  
  
  belongs_to :sender, :class_name => 'User'
  has_many :recipients 
  has_many  :users, :through => :recipients
  
  attr_reader :user_tokens
  
  
  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end
end
