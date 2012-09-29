class Activity < ActiveRecord::Base
#feilds accesible 
 attr_accessible :user, :target_id, :activity_type, :created_at, :updated_at, :target_type, :parent_id, :verb, :scope, :tag_list

#relations for the activity   
  belongs_to :user
  belongs_to :target, :polymorphic => true
  has_many :replies, :class_name => "Post", :foreign_key => "reply_to_id"
  has_and_belongs_to_many :tags
  default_scope :order => 'activities.created_at DESC'
  self.per_page = 10
 
  def to_partial_path() 
    "activities/#{target_type.downcase}" 
  end

  #actions 
   serialize :tag_list
   before_save :generate_taglist
   after_commit :process_tags
  
  private
  
  def generate_taglist
     self.tag_list = self.target.content.scan(/\B#(\w*[A-Za-z0-9_]+\w*)/).flatten
  end
  def process_tags
    TAG_PROCESSOR.push(:activity_id => self.id)
  end
  

end
