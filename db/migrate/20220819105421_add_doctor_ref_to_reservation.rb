class AddDoctorRefToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :doctor, null: false, foreign_key: true
  end
end
