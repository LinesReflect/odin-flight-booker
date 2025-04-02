class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count].to_i
    @passenger_count.times do
      @passenger = @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save!
      redirect_to @booking
    else
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.expect(booking: [ :flight_id, passengers_attributes: [ [ :name, :email ] ] ])
  end
end
