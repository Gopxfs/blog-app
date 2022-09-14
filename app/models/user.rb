class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.show_recent_posts(user)
    return user.posts.limit(3)
  end
end
