require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  describe 'GET #index' do
    it 'renders the Users page' do
      get '/users'

      expect(response).to be_successful

      expect(response).to render_template(:index)

      expect(response.body).to include('Users list')
    end
  end
end
