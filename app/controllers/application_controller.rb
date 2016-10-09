class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger
  class PermissionDenied < StandardError; end

  rescue_from PermissionDenied do
    redirect_to :root, alert: "You don't have permittion."
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :works, :group, :image])
  end

  def comfirm_user(resource)
    if resource.class.name == "User"
      raise PermissionDenied if resource != current_user
    else
      raise PermissionDenied if resource.user != current_user
    end
  end
end
