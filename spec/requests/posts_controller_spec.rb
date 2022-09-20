require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe 'GET #index' do
    it 'renders the posts page' do
      get '/users/1/posts'

      expect(response).to be_successful

      expect(response).to render_template(:index)

      expect(response.body).to include('Posts')
    end
  end

  describe 'GET #show' do
    it 'renders the post page' do
      get '/users/1/posts/1'

      expect(response).to be_successful

      expect(response).to render_template(:show)

      expect(response.body).to include('Post')
    end
  end
end
