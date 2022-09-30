require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/api/users' do
    get('list users') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
