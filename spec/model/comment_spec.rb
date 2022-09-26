require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(
    name: 'Gabriel',
    photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
    bio: "I'm a student at Microverse",
    posts_counter: 0
  )

  subject do
    Comment.new(
      post: Post.new(
        author: user,
        title: 'Title',
        text: 'Text',
        comments_counter: 0,
        likes_counter: 0
      ),
      author: user,
      text: 'This is my comment :)'
    )
  end

  describe '#update_comments_counter' do
    it 'should update the comments counter' do
      expect(subject.send(:update_comments_counter).comments_counter).to eq(subject.post.comments_counter)
    end
  end
end
