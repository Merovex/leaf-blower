class ApplicationController < ActionController::Base

  add_breadcrumb "Home", :root_path
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  include PublicActivity::StoreController

  def find_candidates
    @candidates = {
      :fox => [],
      :hawk => [],
      :lion => []
    }
    # @xx = 
    (Boy.all - @event.boys).sort_by(&:lastnamefirst).each do |b|
    # (Boy.all - @event.boys).each do |b|
      next if b.current_rank.nil?
      next if @candidates[b.current_rank.name.to_sym].nil?
      @candidates[b.current_rank.name.to_sym] << b
    end
    # raise @candidates.inspect

  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end

  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def set_boy
    @boy = Boy.find(params[:boy_id] || params[:id])
  end
  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to (request.referrer || root_path)
  end
  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end
end
