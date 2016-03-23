class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :phone_number
  end

  def after_sign_up_path_for(resource)
  render "pages/onboard"
  end

  def after_sign_in_path_for(resource)
  render "pages/dashboard_business"
  end

end
