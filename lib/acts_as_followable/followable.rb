module ActsAsFollowable
  module Followable #这个是被关注

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_followable #This means can be followed - 被关注
        include ActsAsFollowable::Followable::InstanceMethods
        include ActsAsFollowable::FollowableExt

        has_many :followers, as: :followable, dependent: :destroy, class_name: 'Follow'
      end
    end

    module InstanceMethods
      # 1: 查看某个 模型 关注我的所有对象
      # 2: 查看某个 模型 的某个 实例 是否关注我了
      def followers_count
        self.followers.count
      end

      def followers(follower_type, options = {})
        followers = follower_type.constantize.
          joins(:follows).
          where('follows.followable_id' => self.id,
                'follows.followable_type' => class_name(self),
                'follows.follower_type' => follower_type
        )
        return followers
      end
    end
  end
end
