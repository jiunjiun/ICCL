class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  # ---------------
  # cancan has any err back root_path
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # cancan Ability
  def current_ability
      user = User.find_by_id(session[:UserInfo][:id]) if(session[:UserInfo])
      @current_ability ||= ::Ability.new(user)
  end
  # ---------------

  # before_filter :authenticate

  # def authenticate
  #   if params[:controller]["admin"]
  #
  #     # render layout: "backend"
  #     layout "backend"
  #   end
  # end

  layout :layout_by_resource
  # layout
  def layout_by_resource
    if params[:controller]["admin"]
      "backend"
    elsif params[:controller]["imsu"]
      "imsu"
    end
  end
end
