require 'rails_helper'

RSpec.describe 'reservation Api', type: :request do
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
    @current_user = User.last
  end

  describe 'GET/reservations' do
    it 'should return a list of reservations' do
      FactoryBot.create(:doctor, name: 'Dr. John Doe', detail: 'Dentist',
                                 photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')
      FactoryBot.create(:doctor, id: 2, name: 'Dr. Jane Doe', detail: 'Dentist',
                                 photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')

      FactoryBot.create(:reservation, city: 'Imphal', date: '24/08/2022', user_id: @current_user.id, doctor_id: 1)
      FactoryBot.create(:reservation, city: 'Delhi', date: '24/08/2022', user_id: @current_user.id, doctor_id: 2)

      get '/reservations'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(Reservation.count)
    end
  end

  context 'POST/reservations' do
    it 'should create a new reservation' do
      expect do
        post '/reservations', params: { reservation: { city: 'Imphal', date: '24/08/2022', user_id: @current_user.id, doctor_id: 1 } }
      end.to change(Reservation, :count).by(1)

      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested reservation' do
      reservation = FactoryBot.create(:reservation, city: 'Imphal', date: '24/08/2022', user_id: @current_user.id, doctor_id: 1)
      expect do
        delete :destroy, params: { id: reservation.id }
      end
    end
  end
end
