class Message < ActiveRecord::Base
  
  #fields accessible
  attr_accessible :body, :sender_id, :subject, :user_tokens
  
  #set attribute reader
  attr_reader :user_tokens
  
  #relationships
  belongs_to :sender, :class_name => 'User'
  has_many :recipients 
  has_many  :users, :through => :recipients
  
  
  #create user tokens virtual attribute
  
  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end
end
