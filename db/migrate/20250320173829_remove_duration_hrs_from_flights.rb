class RemoveDurationHrsFromFlights < ActiveRecord::Migration[8.0]
  def change
    remove_column :flights, :duration_hrs
  end
end
