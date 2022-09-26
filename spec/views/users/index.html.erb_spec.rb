require 'rails_helper'

RSpec.describe 'users #index', type: :feature do
  before :each do
    user1 = User.create(
      name: 'Gabriel',
      photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
      bio: "I'm a student at Microverse",
      posts_counter: 0
    )
    user2 = User.create(
      name: 'Second User',
      photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
      bio: "I'm not a student at Microverse",
      posts_counter: 0
    )
    @users = [user1, user2]
    visit '/users'
  end

  it 'displays all users cards' do
    @users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src*='#{user.photo}']")
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  it 'changes to user profile after clicking on a card' do
    click_link(@users.first.name.to_s)
    expect(page).to have_content('Profile')
  end
end
