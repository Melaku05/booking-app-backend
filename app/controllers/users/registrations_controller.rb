class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_seccess && return if resource.persisted?

    register_failed
  end

  def register_seccess
    render json: {
      message: 'Successfully registered',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Failed to register, Somthing went wrong!' }, status: :unprocessable_entity
  end
end
