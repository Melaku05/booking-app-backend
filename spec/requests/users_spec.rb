require 'rails_helper'

RSpec.describe '/users Endpoint', type: :request do

  describe 'GET /users' do
    it 'return code 401 if user is not authenticated' do
      get '/users/'
      expect(response).to have_http_status(401)
    end
    
    it 'return Unauthorized if user is not authenticated' do
      get '/users/'
      expect(response.body).to include("Not Authorized")
    end

    it 'returns a list of users' do
      post '/users', params: {
        user: {
          username: "John Doe",
          email: "test@email.com",
          password: "Password1"
        }
      }.to_json, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      get '/users/'
      expect(response.body).to include("John Doe")
      expect(response.body).to include("test@email.com")
      expect(response.body).to include("created_at")
      expect(response.body).to include("updated_at")
      expect(response.body).to include("id")
      expect(response.body).to include("username")
    end
  end

  describe 'POST /users' do
    it 'return code 200 if user is created and authenticated' do
      post '/users', params: {
        user: {
          username: "John Doe",
          email: "test@email.com",
          password: "Password1"
        }
      }.to_json, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      expect(response.code).to eq('200')
    end

    it 'return code 200 if user is signed out' do
      post '/users', params: {
        user: {
          username: "John Doe",
          email: "test@email.com",
          password: "Password1"
        }
      }.to_json, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      sleep 1
      delete '/users/sign_out'
      expect(response.code).to eq('200')
    end
  end

end