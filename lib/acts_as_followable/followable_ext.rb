module ActsAsFollowable
  module FollowableExt #这个是被关注
    private

    #  有可能有STI的情况出现
    def class_name(obj)
      klass = obj.class
      loop do
        break if klass.superclass.name == 'ApplicationRecord'
        klass = klass.superclass
      end
      klass.name
    end
  end
end
