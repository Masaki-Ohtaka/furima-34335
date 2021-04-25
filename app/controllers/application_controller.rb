class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramters, if: :devise_controller?

private
  def confiqure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname,:last_name,:first_name,:last_kana,:first_kana,:birthday])
  end
end
