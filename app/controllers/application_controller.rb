class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :show_restaurant
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def show_restaurant
    @restaurant_alert = Restaurant.find(1)

  end
end
