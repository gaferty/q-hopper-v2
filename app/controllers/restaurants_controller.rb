class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show, :restaurant_map]

  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def new

  end

  def create

  end

  def destroy

  end

  def restaurant_map
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end
  private

  def set_restaurant
    @restaurant= Restaurant.find(params[:id])
  end
end
