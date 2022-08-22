class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    
    if user.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email]), status: :created
    else
      head(:unauthorized)
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end