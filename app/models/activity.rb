class Activity < ActiveRecord::Base
 
  #fields accesible 
  attr_accessible :user, :target_id, :activity_type, :created_at, :updated_at, :target_type, :parent_id, :verb, :scope, :tag_list

  #relations for the activity   
  belongs_to :user
  belongs_to :target, :polymorphic => true
  has_many :replies, :class_name => "Post", :foreign_key => "reply_to_id"
  has_and_belongs_to_many :tags
  serialize :tag_list
  after_commit :process_tags
  #default scope and set per page limit for will_paginate
  default_scope :order => 'activities.created_at DESC'
  self.per_page = 10
  
  #set the partial path for the observer
  def to_partial_path() 
    "activities/#{target_type.downcase}" 
  end

  #Flatten, generate and process tags.
 
   
  
  private

  def process_tags
    TAG_PROCESSOR.push(:activity_id => self.id)
  end
  

end
