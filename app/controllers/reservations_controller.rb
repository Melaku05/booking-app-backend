class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
    if @reservations.empty?
      json_response({ msg: 'No doctor found' }, 400)
    else
      render json: @reservations
    end
  end

  def create
    @myreservation = current_user.reservations.new(reservation_params)
    if @myreservation.save
      render json: @myreservation
    else
      render json: { success: false, errors: 'Oops something went wrong' }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :user_id, :doctor_id)
  end
end
