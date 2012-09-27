class Activity < ActiveRecord::Base
#feilds accesible 
 attr_accessible :user, :target_id, :activity_type, :created_at, :updated_at, :target_type, :parent_id, :verb, :scope

#relations for the activity   
  belongs_to :user
  belongs_to :target, :polymorphic => true
  
  has_many :replies, :class_name => "Post", :foreign_key => "reply_to_id"
  default_scope :order => 'activities.created_at DESC'
  self.per_page = 10
 
  def to_partial_path() 
    "activities/#{target_type.downcase}" 
  end

 
 
  

end
