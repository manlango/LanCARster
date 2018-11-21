class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name, :phone, :email, :password, :current_password, :is_female, :date_of_birth, :role])
  end





  include Pundit

end
