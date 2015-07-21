class ApplicationController < ActionController::Base

  add_breadcrumb "Home", :root_path
  # check_authorization
  # load_and_authorize_resource

  def find_candidates
    @candidates = {
      :fox => [],
      :hawk => [],
      :lion => []
    }
    # @candidates = (Boy.all - @event.boys).sort_by(&:lastnamefirst)
    (Boy.all - @event.boys).each do |b|
      next if b.current_rank.nil?
      next if @candidates[b.current_rank.name.to_sym].nil?
      @candidates[b.current_rank.name.to_sym] << b
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end

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
  def set_boy
    # id = 
    @boy = Boy.find(params[:boy_id] || params[:id])
    # raise @boy.inspect
  end
  def user_not_authorized
    # flash[:alert] = "Access denied."
    flash[:error] = "You are not authorized to perform this action."
    redirect_to (request.referrer || root_path)
  end

end
