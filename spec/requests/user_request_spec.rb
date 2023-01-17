require 'rails_helper'

RSpec.describe 'Users' do
  describe '/api/v1/users', vcr: {record: :new_episodes}, type: :request do
    it 'has new user' do
      post "/api/v1/users", params: {name: "Jane Doe", email: 'jane.doe@gmail.com'}
      expect(response).to have_http_status(201)
    end
  end
end
