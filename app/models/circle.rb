class Circle < ActiveRecord::Base
  
  attr_accessible :description, :name, :user_tokens
  
  
  belongs_to :author, :class_name => 'User'
  
  has_many :relationships
  has_many :users, :through => :relationships
  
  attr_reader :user_tokens
  
  validates_length_of :name, :maximum => 15
  
  after_create :create_new_relationship
  
  def name_format
  has_one_letter = name =~ /[a-zA-Z]/
  all_valid_characters = name =~ /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/
  
  errors.add(:username, "must have at least one letter and contain only letters, digits, or underscores") unless (has_one_letter and all_valid_characters)
  end
  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end
  
  
  
  
   private
  
    def create_new_relationship
      self.relationships << Relationship.new(:user_id => self.author_id)
    end
end
