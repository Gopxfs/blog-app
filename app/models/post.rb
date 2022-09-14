class Post < ApplicationRecord
  has_many :likes
  has_many :comments

  belongs_to :user

  def self.update_posts_counter(user)
    user.posts_counter = user.posts.length
  end

  def self.show_recent_comments(post)
    post.comments.order('created_at DESC').limit(5)
  end
end