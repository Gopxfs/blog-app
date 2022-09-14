class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comments_counter(post)
    post.comments_counter = post.comments.length
  end
end
