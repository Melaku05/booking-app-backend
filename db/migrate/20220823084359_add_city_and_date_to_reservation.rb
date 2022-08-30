class AddCityAndDateToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :city, :string
    add_column :reservations, :date, :date
  end
end
