require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before(:each) do
    @doctor = Doctor.new(name: 'Dr. John Doe', detail: 'Dentist',
                         photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', city: 'New York', specialization: 'Dentist', fee: '100')
    expect(@doctor).to be_valid
  end

  describe 'model validations' do
    it 'is valid with valid attributes' do
      expect(@doctor).to be_valid
    end

    it 'is valid with a name' do
      @doctor.name = 'Dr. John Doe'
      expect(@doctor).to be_valid
    end

    it 'is not valid without a name' do
      @doctor.name = nil
      expect(@doctor).to_not be_valid
    end

    it ' is valid with a detail' do
      @doctor.detail = 'Dentist'
      expect(@doctor).to be_valid
    end

    it 'is not valid without a detail' do
      @doctor.detail = nil
      expect(@doctor).to_not be_valid
    end

    it 'is valid with a photo' do
      @doctor.photo = 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png'
      expect(@doctor).to be_valid
    end

    it 'is not valid without a photo' do
      @doctor.photo = nil
      expect(@doctor).to_not be_valid
    end

    it 'is valid with a city' do
      @doctor.city = 'New York'
      expect(@doctor).to be_valid
    end

    it 'is not valid without a city' do
      @doctor.city = nil
      expect(@doctor).to_not be_valid
    end

    it 'is valid with a specialization' do
      @doctor.specialization = 'Dentist'
      expect(@doctor).to be_valid
    end

    it 'is not valid without a specialization' do
      @doctor.specialization = nil
      expect(@doctor).to_not be_valid
    end

    it 'is valid with a fee' do
      @doctor.fee = '100'
      expect(@doctor).to be_valid
    end

    it 'is not valid without a fee' do
      @doctor.fee = nil
      expect(@doctor).to_not be_valid
    end
  end
end
