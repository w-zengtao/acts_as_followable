require 'acts_as_follower'
require 'rails'

module ActsAsFollower
  class Railtie < Rails::Railtie
    
    initializer "acts_as_followable.active_record" do |app|
      ActiveSupport.on_load :active_record do
        # include ActsAsFollowable::Follower
        include ActsAsFollowable::Followable
      end
    end

  end
end
