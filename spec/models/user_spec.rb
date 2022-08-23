require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    User.create(username: 'John Doe', email: 'test@email.com', password: 'Password1')
  end

  describe 'Test validations' do
    it 'Create a new user' do
      user = User.create(username: 'John D', email: 'test@mmail.com', password: 'Password2')
      expect(user).to be_valid
    end

    it 'raises an error if username, or email is duplicated' do
      user = User.create(username: 'John Doe', email: 'test@email.com', password: 'Password2')
      expect(user).to_not be_valid
    end

    it 'raises an error if username is not present' do
      user = User.create(email: 'test@ismail.com', password: 'Password1')
      expect(user).to_not be_valid
    end

    it 'raises an error if email is not present' do
      user = User.create(username: 'John D', password: 'Password1')
      expect(user).to_not be_valid
    end

    it 'raises an error if password is not present' do
      user = User.create(username: 'John D', email: 'test@ismail.com')
      expect(user).to_not be_valid
    end
  end
end
