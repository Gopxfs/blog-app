class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(post)
    post.likes_counter = post.likes.length
  end
end
