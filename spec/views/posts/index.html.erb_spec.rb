require 'rails_helper'

RSpec.describe 'posts #index', type: :feature do
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
        Post.create(author: @user, title: 'Title4', text: 'Text4', comments_counter: 0, likes_counter: 0)
        User.create(
          name: '1st',
          photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
          bio: "I'm a student at Microverse",
          id: 1,
          posts_counter: 0
        )
        visit "/users/#{@user.id}"
    end

    it 'displays all users cards' do
        @users.each do |user|
          expect(page).to have_content(user.name)
          expect(page).to have_css("img[src*='#{user.photo}']")
          expect(page).to have_content("Number of posts: #{user.posts_counter}")
        end
    end

    it 'can display all posts' do
        @users.each do |user|
            click_link(user.name.to_s)
            expect(page).to have_content('Title')
            expect(page).to have_content('Title2')
            expect(page).to have_content('Title3')
        end
    end

    it 'can display the first post content' do
        @users.each do |user|
            click_link(user.name.to_s)
            expect(page).to have_content('Text')
        end
    end

    it 'redirects the user to the post show page' do
        @users.each do |user|
            click_link(user.name.to_s)
            click_link('Title')
            expect(current_path).to eq("/users/#{user.id}/posts/#{user.posts.first.id}")
        end
    end
end