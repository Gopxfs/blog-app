class Post < ApplicationRecord
  has_many :likes
  has_many :comments

  belongs_to :user

  after_save :update_posts_counter

  def update_posts_counter
    user.update(posts_counter: user.posts.length)
  end

  def show_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
