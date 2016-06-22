require "acts_as_followable/version"

module ActsAsFollowable
  autoload :Followable,   'acts_as_followable/followable'
  # autoload :Follower,   'acts_as_followable/follower'
  autoload :FollowExt,   'acts_as_followable/follow_ext'

  require acts_as_followable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
end
