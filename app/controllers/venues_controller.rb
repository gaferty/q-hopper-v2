class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]
  def index
    @venues = Restaurant.where(user: current_user)
  end

  def show
    @bookings = Booking.includes(:user).where(restaurant: @venue)
  end

  def add_group

    @front_of_queue = Booking.find_by(restaurant_id:params[:venue_id], join: false)
    @bookings = Booking.where(restaurant_id: params[:venue_id])
    user = User.find(2)
    @front_of_queue.update(join: true)
    @front_of_queue.save
    RestaurantChannel.broadcast_to(
      user,
      render_to_string(partial:'shared/accept_booking',locals:{restaurant_id: params[:venue_id], booking_id: @front_of_queue.id})
    )
    redirect_to venue_path(params[:venue_id])

  end

  private

  def set_venue
    @venue = Restaurant.find(params[:id])

  end
end
