class AddPassengerReferenceToBookings < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :passengers
  end
end
