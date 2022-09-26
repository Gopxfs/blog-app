require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(
    name: 'Gabriel',
    photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
    bio: "I'm a student at Microverse",
    posts_counter: 0
  )

  subject do
    Like.new(
      post: Post.new(
        author: user,
        title: 'Title',
        text: 'Text',
        likes_counter: 0,
        comments_counter: 0
      ),
      author: user
    )
  end

  describe '#update_likes_counter' do
    it 'should update the likes counter' do
      expect(subject.send(:update_likes_counter).likes_counter).to eq(subject.post.likes_counter)
    end
  end
end
