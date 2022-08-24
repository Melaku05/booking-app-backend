class UsersController < ApplicationController
  def index
    @user = current_user
    if current_user
      render json: @user
    else
      render json: { error: 'User not found' }, status: 404
    end
  end
end
