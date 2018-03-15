require "acts_as_followable/version"

module ActsAsFollowable
  extend ActiveSupport::Autoload
  autoload :Followable,     'acts_as_followable/followable'
  autoload :FollowableExt,  'acts_as_followable/followable_ext'
  autoload :Unlikable,      'acts_as_followable/unlikable'
  autoload :Unliker,        'acts_as_followable/unliker'

  # require 'acts_as_followable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  ActiveSupport.on_load(:active_record) do
    include ActsAsFollowable::Followable
    include ActsAsFollowable::Follower
    include ActsAsFollowable::Unlikable
    include ActsAsFollowable::Unliker
  end

end
