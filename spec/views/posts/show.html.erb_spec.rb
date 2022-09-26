require 'rails_helper'

RSpec.describe 'posts #show', type: :feature do
        before :each do
        @user = User.create(
          name: 'Gabriel',
          photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
          bio: "I'm a student at Microverse",
          posts_counter: 0
        )
        Post.create(author: @user, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)
        Post.create(author: @user, title: 'Title2', text: 'Text2', comments_counter: 0, likes_counter: 0)
        Post.create(author: @user, title: 'Title3', text: 'Text3', comments_counter: 0, likes_counter: 0)
        @post = Post.create(author: @user, title: 'Title4', text: 'Text4', comments_counter: 0, likes_counter: 0)
        User.create(
          name: '1st',
          photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
          bio: "I'm a student at Microverse",
          id: 1,
          posts_counter: 0
        )
        visit "/users/#{@user.id}/posts/#{@post.id}"
    end


    describe 'post show page' do
      it 'shows the post\'s title' do
        expect(page).to have_content(@post.title)
      end
  
      it 'shows who wrote the post' do
        expect(page).to have_content(@user.name)
      end
  
      it 'shows how many comments there are on a post' do
        expect(page).to have_content(@post.comments.count)
      end

        it 'shows how many likes there are on a post' do
        expect(page).to have_content(@post.likes.count)
      end

      it 'shows the post body' do
        expect(page).to have_content(@post.text)
      end

      it 'shows all comments and the author name' do
        comments = @post.comments
        comments.each do |comment|
          expect(page).to have_content(comment.author.name)
          expect(page).to have_content(comment.text)
        end
      end
    end
  end