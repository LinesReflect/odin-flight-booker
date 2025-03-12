# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

[ "ATL", "LAX", "DFW", "DEN", "ORD", "LAS", "IAH", "JFK", "MIA" ].each do |code|
  Airport.find_or_create_by!(code: code)
end

Airport.all.each do |departure_airport|
  Airport.all.each do |arrival_airport|
    next if departure_airport == arrival_airport

    Flight.find_or_create_by!(departure_airport_id: departure_airport.id, arrival_airport_id: arrival_airport.id)
  end
end
