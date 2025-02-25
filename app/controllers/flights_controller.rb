class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    @searched_flights = Flight.where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id])
  end
end
