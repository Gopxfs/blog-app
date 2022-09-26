require 'rails_helper'

RSpec.describe 'users #show', type: :feature do
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

  it 'displays the user profile' do
    expect(page).to have_content(@user.name)
    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content("I've created #{@user.posts_counter} posts in total.")
    expect(page).to have_content(@user.bio)
  end

  it 'displays the users first three posts' do
    recent_posts = @user.show_recent_posts
    recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  it 'contains a button that shows all posts' do
    expect(page).to have_content('See all posts')
  end

  it 'redirects the user to the complete posts list' do
    click_link('See all posts')
    expect(current_path).to eq("/users/#{@user.id}/posts")
  end

  it 'redirects the user to the post show page' do
    click_link(@user.posts.last.title.to_s)
    expect(current_path).to eq("/users/#{@user.id}/posts/#{@user.posts.last.id}")
  end
end
