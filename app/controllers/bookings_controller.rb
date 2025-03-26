class BookingsController < ApplicationController
  def new
    @boking = Booking.new
  end
end
