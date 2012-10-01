class Membership < ActiveRecord::Base
  
  #fields accessible
  attr_accessible :user_id, :group_id,:blocked, :pending
  
  #relationships
  belongs_to :user
  belongs_to :group

end
