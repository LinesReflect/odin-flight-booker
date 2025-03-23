class AddFlightToBookings < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :flight
  end
end
