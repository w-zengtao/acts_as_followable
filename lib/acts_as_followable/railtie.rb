# require 'acts_as_followable'
# require 'rails'

# module ActsAsFollowable
#   class Railtie < Rails::Railtie
#     initializer "acts_as_followable.active_record" do |app|
#       ActiveSupport.on_load :active_record do
#         include ActsAsFollowable::Followable
#         include ActsAsFollowable::Follower
#         include ActsAsFollowable::Unlikable
#       end
#     end
#   end
# end
