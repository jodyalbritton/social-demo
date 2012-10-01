require 'file_size_validator'
class Post < ActiveRecord::Base
   
   attr_accessible :content, :user, :parent_id, :scope, :date, :attachment, :reply_to_id
   
   #includes 
   include Likeable
   mount_uploader :attachment, AttachmentUploader
   
   #relationships 
   
   belongs_to :in_reply_to, :class_name => "Activity", :foreign_key => "reply_to_id"
   belongs_to :user
   
   has_many :activities, :as => :target, dependent: :destroy
  
   
   #validations 
   
   validates_presence_of :content
   
    

end
