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

好了 先随意撸一下Doc吧 下次有空更新
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
