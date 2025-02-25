class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def flight_departure_to_destination_name
    "Flight: #{id}, #{departure_airport.airport_code} -> #{arrival_airport.airport_code}"
  end
end
