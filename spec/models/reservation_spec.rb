require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:all) do
    @user = User.create(username: "john doe1#{SecureRandom.hex}", email: "jod#{SecureRandom.hex}@test.com", password: '123456')
    expect(@user).to be_valid
    @doctor = Doctor.create!(name: 'doc1', detail: 'doctor details1', photo: 'some url1', city: 'some city1', specialization: 'specialization1', fee: 100.00)
    @reservation = Reservation.new(city: 'Imphal', date: '23/8/2022', user_id: @user.id, doctor_id: @doctor.id)
  end

  describe 'Model validations' do
    it 'is valid with valid attributes' do
      expect(@reservation).to be_valid
    end

    it 'should have the city' do
      expect(@reservation.city).to eq('Imphal')
    end
    it 'should have the date' do
      expect(@reservation.date).to eq('23/8/2022')
    end
    it 'should not have blank city' do
      @reservation.city = ''
      expect(@reservation).to_not be_valid
    end
    it 'should not have blank date' do
      @reservation.date = ''
      expect(@reservation).to_not be_valid
    end
    it 'should not have city less than 3 characters' do
      @reservation.city = 'Im'
      expect(@reservation).to_not be_valid
    end
    it 'should not have city more than 50 characters' do
      @reservation.city = 'Imphal' * 10
      expect(@reservation).to_not be_valid
    end
    it 'should not have date that is blank' do
      @reservation.date = ''
      expect(@reservation).to_not be_valid
    end
    it 'should not have date that is more than 10 characters' do
      @reservation.date = '23/8/2022' * 2
      expect(@reservation).to_not be_valid
    end
  end
end
