class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy

  def show_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
