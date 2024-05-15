class RestaurantsController < ApplicationController

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

  def destroy

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
