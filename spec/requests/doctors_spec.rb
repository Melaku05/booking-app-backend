require 'rails_helper'

describe 'doctor Api', type: :request do
  context 'GET/doctors' do
    it 'should return a list of doctors' do
      FactoryBot.create(:doctor, name: 'Dr. John Doe', detail: 'Dentist',
                                 photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')
      FactoryBot.create(:doctor, name: 'Dr. Jane Doe', detail: 'Dentist',
                                 photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')
      get '/doctors'
      expect(response).to have_http_status(:success)
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

  context 'DELETE/doctors/:id' do
    it 'should delete a doctor' do
      FactoryBot.create(:doctor, name: 'Dr. John Doe', detail: 'Dentist',
                                 photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')
      expect do
        delete "/doctors/#{Doctor.first.id}"
      end.to change(Doctor, :count).by(-1)

      expect(response).to have_http_status(:no_content)
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
end
