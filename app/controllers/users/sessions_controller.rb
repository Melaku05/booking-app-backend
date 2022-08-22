class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  private
  
    def respond_with(resource, _opts = {})
      render json: {
        message: "Successfully authenticated",
        user: current_user
      }, status: :ok
    end
    
    def respont_to_on_destroy
      log_out_seccess && return if current_user

      log_out_failure
    end
    
    def log_out_seccess
      render json: { message: "Successfully logged out" }, status: :ok
    end

    def log_out_failure
      render json: { message: "Failed to log out, Somthing went wrong!" }, status: :unauthorized
    end