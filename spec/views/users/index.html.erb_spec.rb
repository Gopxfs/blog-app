describe 'the users list', type: :feature do
  before :each do
    @users = User.all
  end

  it 'displays all users cards' do
    visit '/users'
    within ('#users') do
      @users.each do |user|
        expect(page).to have_content user.name
        expect(page).to have_content user.photo
        expect(page).to have_content user.posts_counter
      end
    end
  end

end