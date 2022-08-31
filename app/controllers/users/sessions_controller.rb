class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    log_in_seccess && return if current_user

    log_in_failure
  end

  def log_in_seccess
    render json: {
      message: 'Successfully authenticated',
      user: current_user
    }, status: :ok
  end

  def log_in_failure
    render json: { message: 'Failed to authenticate, Somthing went wrong!' }, status: :unprocessable_entity
  end

  def respond_to_on_destroy
    log_out_seccess && return unless current_user

    log_out_failure
  end

  def log_out_seccess
    render json: { message: 'Successfully logged out' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Failed to log out, Somthing went wrong!' }, status: :unauthorized
  end
end
