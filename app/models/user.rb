class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def show_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
