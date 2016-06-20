module ActsAsFollowable
  module Followable

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_followable #This means can be followed - 被关注
        include ActsAsFollowable::Followable::InstanceMethods
      end
    end

    module InstanceMethods
      # 1: 查看某个 模型 关注我的所有对象
      # 2: 查看某个 模型 的某个 实例 是否关注我了
    end
  end
end
