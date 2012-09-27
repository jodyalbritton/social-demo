class Relationship < ActiveRecord::Base
  attr_accessible :user_id, :circle_id
  
  belongs_to :user
  belongs_to :circle
  # attr_accessible :title, :body
end
