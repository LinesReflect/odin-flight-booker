class RenameDurationToDurationHrsInFlights < ActiveRecord::Migration[8.0]
  def change
    rename_column :flights, :duration, :duration_hrs
  end
end
