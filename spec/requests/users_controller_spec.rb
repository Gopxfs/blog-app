require 'rails_helper'

RSpec.describe "Users Controller", :type => :request do
    it "renders and redirects to the User's page" do
      get "/users"
      expect(response).to render_template(:index)
    end
end