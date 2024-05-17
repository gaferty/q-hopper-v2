class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show, :restaurant_map]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new

  end

  def create

  end


  def test
    @restaurants = Restaurant.all
  end

  def restaurant_map
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window_html: render_to_string(partial: "map_card", locals: {restaurant: restaurant}),
        marker_html: render_to_string(partial: "shared/marker")
      }
    end
  end
  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
