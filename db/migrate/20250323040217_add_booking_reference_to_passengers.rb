class AddBookingReferenceToPassengers < ActiveRecord::Migration[8.0]
  def change
    add_reference :passengers, :booking
  end
end
