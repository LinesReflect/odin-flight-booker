class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count].to_i
    @passenger_count.times do
      @passenger = @booking.passengers.build
    end
  end
end
