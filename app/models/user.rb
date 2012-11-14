class User < ActiveRecord::Base
  
  include Likeable::UserMethods
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_follower
  acts_as_followable
  rolify
  
  #validations 
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :case_sensitive => false
  validate :username_format
  validates_confirmation_of :password
  
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name,:email, :password, :password_confirmation, :remember_me, :username, :profile_attributes, 
  :settings_attributes, :dgoal_attributes, :opt_in, :privacy, :notify_by_email

 
  after_create :initialize_profile
  
   #assoications
   
   has_many :activities, dependent: :destroy
   has_many :groups
   has_many :memberships, dependent: :destroy
   has_many :relationships, dependent: :destroy
   has_many :circles, :foreign_key => :author_id
   has_many :messages, :foreign_key => :sender_id
   has_many :posts, dependent: :destroy
   has_one :profile, dependent: :destroy
 
 
  
  accepts_nested_attributes_for :profile
  
  def initialize_profile
      (self.profile = Profile.new).save
  end


    def audience
     audience = self.followers
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end
 
  def username_format
  has_one_letter = username =~ /[a-zA-Z]/
  all_valid_characters = username =~ /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/
  errors.add(:username, "must have at least one letter and contain only letters, digits, or underscores") unless (has_one_letter and all_valid_characters)
  end
  
  def update_with_password(params={})
        current_password = params.delete(:current_password)

        if params[:password].blank?
          params.delete(:password)
          params.delete(:password_confirmation) if params[:password_confirmation].blank?
        end 

        result = if params[:password].blank? || valid_password?(current_password) 
          update_attributes(params)
        else
          self.attributes = params
          self.valid?
          self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
          false
        end 

        clean_up_passwords
        result
      end 
end
