class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :date_of_birth, :avatar
   
  belongs_to :user 
end
