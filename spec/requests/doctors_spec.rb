require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'doctor Api', type: :request do
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
  end

  describe 'GET/doctors' do
    it 'should return a list of doctors' do
      FactoryBot.create(:doctor, name: 'Dr. John Doe', detail: 'Dentist',
                                 photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')
      FactoryBot.create(:doctor, name: 'Dr. Jane Doe', detail: 'Dentist',
                                 photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')
      get '/doctors'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(Doctor.count)
    end
  end

  context 'POST/doctors' do
    it 'should create a new doctor' do
      expect do
        post '/doctors', params: { doctor: { name: 'Dr. John Doe', detail: 'Dentist', photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100' } }
      end.to change(Doctor, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end
end

describe 'DELETE #destroy' do
  it 'destroys the requested doctor' do
    doctor = FactoryBot.create(:doctor)
    expect do
      delete :destroy, params: { id: doctor.id }
    end
  end
end
