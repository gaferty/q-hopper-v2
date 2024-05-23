class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Adding before_action to configure permitted parameters for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  protected

  def after_sign_in_path_for(resource)
    # Redirect to the desired path after sign-in
    restaurant_map_path # Assuming this is defined in your routes
  end
end
