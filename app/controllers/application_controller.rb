class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ---------------
  # cancan Ability
  def current_ability
      @current_ability ||= ::Ability.new(User.find_by_id(session[:UserInfo][:id]))
  end

  # cancan has any err back root_path
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  # ---------------


  before_filter :authenticate

  def authenticate
    if params[:controller]["admin"]
      # layout
      render layout: "backend"
    end
  end
end
