class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = fetch_user_from_token
    render json: {
      message: 'Successfully authenticated',
      # removed user: user to avoid lint error, but it's not necessary
      user:
    }
  end

  private

  def fetch_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split[1],
                             Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    # not
    User.find(user_id.to_s)
  end
end
