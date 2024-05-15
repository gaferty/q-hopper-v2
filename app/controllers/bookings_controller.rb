class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :new, :create]
  def index
    @bookings = Booking.where(user_id: 1)
    #For each of the bookings return the results before the created date timestamp
    @booking_infos = []
    @bookings.each do |booking|
      @booking_infos << {
        booking: booking,
        queue_position: Booking.where("restaurant_id=? AND created_at <= ? AND accepted = false",booking.restaurant_id, booking.created_at).count
      }

    end
  end

  def show

  end

  def new

  end

  def create

  end

  def destroy

  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
