class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.show_recent_posts(user)
    user.posts.order('created_at DESC').limit(3)
  end
end
