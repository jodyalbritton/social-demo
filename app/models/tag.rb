class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :content, use: :slugged

  attr_accessible :content
  
  has_and_belongs_to_many :activities
  
  def trend_count
     self.activities.count  
  end
  
  def self.process_tags(activity_id)
    p = Activity.find(activity_id)
    p.tag_list.each do |tag|
      t = find_or_initialize_by_content(tag.downcase)
      t.activities << p
      t.save
    end
  end
end
