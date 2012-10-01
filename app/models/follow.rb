class Follow < ActiveRecord::Base
  #call acts_as_follower gem
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true
  
  
  #call this method to block a user
  def block!
    self.update_attribute(:blocked, true)
  end

end
