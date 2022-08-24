require 'rails_helper'

RSpec.describe '/users Endpoint', type: :request do
  before :each do
    post '/users', params: {
      user: {
        username: 'John Doe',
        email: 'test@email.com',
        password: 'Password1'
      }
    }.to_json, headers: {
      'Content-Type': 'application/json',
      Accept: 'application/json'
    }
    delete '/users/sign_out'
  end

  describe 'GET /users' do
    it 'returns code 401 if user is not authenticated' do
      get '/users/'
      expect(response).to have_http_status(401)
    end

    it 'returns Unauthorized if user is not authenticated' do
      get '/users/'
      expect(response.body).to include('Not Authorized')
    end

    it 'returns a list of users' do
      post '/users/sign_in', params: {
        user: {
          email: 'test@email.com',
          password: 'Password1'
        }
      }.to_json, headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }

      get '/users/'
      expect(response.body).to include('John Doe')
      expect(response.body).to include('test@email.com')
      expect(response.body).to include('created_at')
      expect(response.body).to include('updated_at')
      expect(response.body).to include('id')
      expect(response.body).to include('username')
    end
  end

  describe 'POST /users' do
    it 'returns code 200 if user is created and authenticated' do
      expect(response.code).to eq('200')
    end
  end

  describe 'POST /users/sign_in' do
    it 'returns code 200 when the user is authenticated' do
      post '/users/sign_in', params: {
        user: {
          email: 'test@email.com',
          password: 'Password1'
        }
      }.to_json, headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }
      expect(response.code).to eq('200')
    end

    it 'returns a the user info when user is authenticated' do
      post '/users/sign_in', params: {
        user: {
          email: 'test@email.com',
          password: 'Password1'
        }
      }.to_json, headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }

      expect(response.body).to include('John Doe')
      expect(response.body).to include('test@email.com')
      expect(response.body).to include('created_at')
      expect(response.body).to include('updated_at')
      expect(response.body).to include('id')
      expect(response.body).to include('username')
    end
  end

  describe 'DELETE /users/sign_out' do
    it 'return code 200 if user is signed out' do
      delete '/users/sign_out'
      expect(response.code).to eq('200')
    end

    it 'return message if user is signed out' do
      delete '/users/sign_out'
      expect(response.body).to include('Successfully logged out')
    end
  end
end
