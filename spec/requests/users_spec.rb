require 'rails_helper'


RSpec.describe 'v1/users', type: :request do

 
  describe 'POST /create' do
    context 'with valid parameters' do
      it 'returns token and user info' do
        post v1_users_signup_path, params: { username: 'John', email: 'test@test.com', password: 'password' }
        body = response.parsed_body
        expect(body['token']).to_not be nil
      end
    end
  end
end

  #     it 'renders a JSON response with the new user' do
  #       post users_url,
  #            params: { user: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new User' do
  #       expect do
  #         post users_url,
  #              params: { user: invalid_attributes }, as: :json
  #       end.to change(User, :count).by(0)
  #     end

  #     it 'renders a JSON response with errors for the new user' do
  #       post users_url,
  #            params: { user: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end

  #     it 'updates the requested user' do
  #       user = User.create! valid_attributes
  #       patch user_url(user),
  #             params: { user: new_attributes }, headers: valid_headers, as: :json
  #       user.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'renders a JSON response with the user' do
  #       user = User.create! valid_attributes
  #       patch user_url(user),
  #             params: { user: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'renders a JSON response with errors for the user' do
  #       user = User.create! valid_attributes
  #       patch user_url(user),
  #             params: { user: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested user' do
  #     user = User.create! valid_attributes
  #     expect do
  #       delete user_url(user), headers: valid_headers, as: :json
  #     end.to change(User, :count).by(-1)
    # end
  #  end
# end
