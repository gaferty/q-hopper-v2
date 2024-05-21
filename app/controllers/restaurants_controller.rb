class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show, :restaurant_map]

  def index
    @restaurants = Restaurant.all
      if params[:query].present?
        @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
      end

      respond_to do |format|
        format.html
        format.text { render partial: 'restaurants/list-card', locals: { restaurants: @restaurants}, formats: [:html] }
      end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
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

  def italian
    @restaurants = Restaurant.where(cuisine: "Italian")

    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'restaurants/list-card', locals: { restaurants: @restaurants}, formats: [:html] }
    end
  end

  def mexican
    @restaurants = Restaurant.where(cuisine: "Mexican")

    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'restaurants/list-card', locals: { restaurants: @restaurants}, formats: [:html] }
    end
  end

  def indian
    @restaurants = Restaurant.where(cuisine: "Indian")

    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'restaurants/list-card', locals: { restaurants: @restaurants}, formats: [:html] }
    end
  end

  def chinese
    @restaurants = Restaurant.where(cuisine: "Chinese")

    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'restaurants/list-card', locals: { restaurants: @restaurants}, formats: [:html] }
    end
  end

  def thai
    @restaurants = Restaurant.where(cuisine: "Thai")

    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'restaurants/list-card', locals: { restaurants: @restaurants}, formats: [:html] }
    end
  end

  def american
    @restaurants = Restaurant.where(cuisine: "American")

    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'restaurants/list-card', locals: { restaurants: @restaurants}, formats: [:html] }
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
