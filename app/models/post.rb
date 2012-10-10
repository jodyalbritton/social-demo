require 'file_size_validator'
class Post < ActiveRecord::Base
   
   attr_accessible :content, :user, :parent_id, :scope, :date, :attachment, :reply_to_id, :tag_list
   
   #includes 
   include Likeable
   mount_uploader :attachment, AttachmentUploader
   
   #relationships 
   
   belongs_to :in_reply_to, :class_name => "Activity", :foreign_key => "reply_to_id"
   belongs_to :user
   
   has_many :activities, :as => :target, dependent: :destroy
   serialize :tag_list
   before_save :generate_taglist
   
   #validations 
   
   validates_presence_of :content
   
  private 
  def generate_taglist
     self.tag_list = self.content.scan(/\B#(\w*[A-Za-z0-9_]+\w*)/).flatten
  end
end
