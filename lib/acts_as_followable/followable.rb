module ActsAsFollowable
  module Followable #这个是被关注

    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      def acts_as_followable #This means can be followed - 被关注
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

      def followers_by_type(follower_type, options = {})
        klass = follower_type.constantize
        ids = Follow.
          where('followable_id' => self.id,
                'followable_type' => class_name(self),
                'follower_type' => follower_type
        ).pluck('follower_id')
        return klass.find(ids)
      end
    end
  end

  module Follower
    module ClassMethods
      def acts_as_follower
        include ActsAsFollowable::FollowableExt
        has_many :follows, as: :follower, dependent: :destroy, class_name: 'Follow'
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end

    module InstanceMethods
      #   # 1:   关注某人
      #   # 2:   取消关注
      #   # 3:   是否关注
      #   # 4:   关注了某个 model 多少个 obj
      def follow(obj)
        self.follows.find_or_create_by(followable_id: obj.id, followable_type: class_name(obj)) if obj != self
      end

      def unfollow(obj)
        get_follow_by_obj(obj).destroy
      end

      def follow?(obj)
        !get_follow_by_obj(obj).blank?
      end

      private
      def get_follow_by_obj(obj)
        self.follows.find_by(followable_id: obj.id, followable_type: class_name(obj))
      end

    end
  end
end
