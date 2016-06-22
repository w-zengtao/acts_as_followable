module ActsAsFollowable
  module FollowableExt #这个是被关注
    private

    #  有可能有STI的情况出现
    def class_name(obj)
      obj.class.superclass != ApplicationRecord ?  obj.class.superclass.name : obj.class.name
    end
  end
end
