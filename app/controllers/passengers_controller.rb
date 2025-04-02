class PassengersController < ApplicationController
  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    @passenger.save
  end

  private

  def passenger_params
    params.expect(passenger: [ :name, :email ])
  end
end
