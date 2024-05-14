class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :new, :create]
  def index

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
