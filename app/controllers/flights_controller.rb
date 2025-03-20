class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    if params[:departure_airport].present?
      @flight_search_results = Flight.where("departure_airport_id = ? AND arrival_airport_id = ? AND departure_date LIKE ?",
         params[:departure_airport], params[:arrival_airport], params[:departure_date] + "%")
    end
  end
end
