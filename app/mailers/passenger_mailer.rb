class PassengerMailer < ApplicationMailer
  default from: "lines@example.com"

  def confirmation_email
    @user = params[:user]
    @booking = @user.booking
    mail(to: @user.email, subject: "Flight Booking Confirmation")
  end
end
