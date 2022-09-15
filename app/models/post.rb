class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  belongs_to :author, class_name: 'User', foreign_key: :user_id

  after_save :update_posts_counter

  def show_recent_comments
    comments.order('created_at DESC').limit(5)
  end

  private
  
  def update_posts_counter
    author.update(posts_counter: author.posts.length)
  end
end
