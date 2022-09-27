class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    default_parameters = %i[name bio photo password]
    devise_parameter_sanitizer.permit(:sign_up, keys: default_parameters)
    devise_parameter_sanitizer.permit(:sign_in, keys: default_parameters)
    devise_parameter_sanitizer.permit(:account_update, keys: default_parameters)
  end
end
