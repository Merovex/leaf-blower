class ApplicationController < ActionController::Base

  add_breadcrumb "Home", :root_path


  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # after_filter :verify_authorized,  except: :index
  # after_filter :verify_policy_scoped, only: :index

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    # flash[:alert] = "Access denied."
    flash[:error] = "You are not authorized to perform this action."
    redirect_to (request.referrer || root_path)
  end

end
