require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Gabriel',
      photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
      bio: "I'm a student at Microverse",
      posts_counter: 0
    )
  end

  before { subject.save }

  describe 'name' do
    it 'should not be nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'posts_counter' do
    it 'should be an integer' do
      expect(subject.posts_counter).to be_an_integer
    end
    it 'should be greater than or equal to 0' do
      expect(subject.posts_counter).to be >= 0
    end
  end
  
  describe '#show_recent_posts' do
    it 'should return the last 3 posts' do
      subject.posts.create(title: 'title', text: 'text', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'title2', text: 'text2', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'title3', text: 'text3', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'title4', text: 'text4', comments_counter: 0, likes_counter: 0)

      expect(subject.show_recent_posts.count).to eq(3)
    end
  end

end
