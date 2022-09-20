require 'rails_helper'

RSpec.describe 'Main Controller', type: :request do
  describe 'GET #index' do
    it 'renders the main page' do
      get '/main'

      expect(response).to be_successful

      expect(response).to render_template(:index)

      expect(response.body).to include('Main')
    end
  end
end
