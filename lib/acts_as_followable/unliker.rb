module ActsAsFollowable
  module Unliker
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_unliker
        include ActsAsFollowable::FollowableExt
        has_many :unlikes, as: :unliker, dependent: :destroy, class_name: 'Unlike' # 有很多不喜欢的 Object
      end
    end

    module InstanceMethods
      # 不喜欢某对象
      def unlike(obj)
        self.unlikes.find_or_create_by(unlikable_type: class_name(obj), unlikable_id: obj.id) if obj != self
      end

      # 是否不喜欢某对象
      def unlike?(obj)
        !unlike_by(obj).blank?
      end

      private

      def unlike_by(obj)
        self.unlikes.find_by(unlikable_type: class_name(obj), unlikable_id: obj.id)
      end
    end
  end
end
