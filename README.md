# ActsAsFollowable

这就是一个给国人用的 关注（点赞）有关的 Gem 目前仅仅只想支持Rails5

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_followable', git: 'git://github.com/w-zengtao/acts_as_followable.git'
```

And then execute:

    $ bundle

## Usage

最开始你需要:
```ruby
rails g acts_as_followable
rails db:migrate
```

然后有两个类方法可以放在需要使用的类中:
```ruby
acts_as_followable  #被关注
acts_as_follower    #关注者

class Article < ApplicationRecord
  acts_as_followable
end

class User < ApplicationRecord
  acts_as_follower
end
```

acts_as_followable
```ruby
acts_as_followable

#找出某个模型关注我的所有的对象
Article.followers_by_type(User)
```

acts_as_follower
```ruby
acts_as_follower

# 关注某个模型的某个对象
User.first.follow(Article.first)
# 万恶的取关
User.first.unfollow(Article.first)
# 查看是否关注某个对象
User.first.follow?(Article.first)
# 查看关注模型的所有对象
User.first.followings(Article)
```
以上是目前实现的功能 还有黑名单等功能待实现
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
