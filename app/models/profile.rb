class Profile < ActiveRecord::Base
  attr_accessible :fname, :lname, :birthdate, :description, :avatar, :crop_x, :crop_y, :crop_w, :crop_h
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  
  
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :user
 
 def crop_avatar
    avatar.recreate_versions! if crop_x.present?
 end
 
 
 def age         
 age = (Date.today.year - self.birthdate.year).to_i
 end 


 
 
 
 

  

  
end
