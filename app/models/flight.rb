class Flight < ApplicationRecord
  belongs_to :departure_airport, foreign_key: "departure_airport_id", class_name: "Airport"
  belongs_to :arrival_airport, foreign_key: "arrival_airport_id", class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def format_departure_date
    self.departure_date.strftime("%A, %B %d, %Y")
  end

  def departure_date_to_date
    self.departure_date.to_date
  end

  def self.distinct_days
    flights_distinct_days = []
    Flight.all.each do |f|
      flights_distinct_days.push(f) unless flights_distinct_days.any? { |added_flight| added_flight.departure_date.to_date == f.departure_date.to_date }
    end
    flights_distinct_days
  end

  def format_flight_radio_label
    "Flight ##{self.id}: #{self.departure_airport.code} → #{self.arrival_airport.code} Duration: #{self.duration_hrs} hour(s) "
  end
end
