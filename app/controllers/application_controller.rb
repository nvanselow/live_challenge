class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:display_name, :avatar])
  end

  def authorize_admin
    if !user_signed_in? || !current_user.admin?
      flash[:alert] = "You do not have permission to do that."
      redirect_to root_path
    end
  end
end
