require 'file_size_validator'
class Post < ActiveRecord::Base
   
   attr_accessible :content, :user, :parent_id, :scope, :date, :attachment, :reply_to_id
   
   #includes 
   include Likeable
   mount_uploader :attachment, AttachmentUploader
   
   #associations 
   
   belongs_to :in_reply_to, :class_name => "Activity", :foreign_key => "reply_to_id"
   belongs_to :user
   has_and_belongs_to_many :tags
   has_many :activities, :as => :target, dependent: :destroy
   
   #validations 
   
   validates_presence_of :content
   
   #actions 
   serialize :tag_list
   before_save :generate_taglist
   after_commit :process_tags
    
   
  
   
   
  

      
  private
  def generate_taglist
     self.tag_list = self.content.scan(/\B#(\w*[A-Za-z0-9_]+\w*)/).flatten
  end
  def process_tags
    TAG_PROCESSOR.push(:post_id => self.id)
  end

    
       
 
   
    
            

end
