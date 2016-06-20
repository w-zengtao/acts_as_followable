class Follow < ActiveRecord::Base
  # extend ActsAsFollower::FollowerLib
  # extend ActsAsFollower::FollowScopes

  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true

  def block!
    self.update_attribute(:blocked, true)
  end

end
