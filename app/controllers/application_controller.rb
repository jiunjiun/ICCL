class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  before_filter :authenticate, :statistics

  def authenticate
    @uesr_info = User.find_by_id(session[:UserInfo][:id]) if(session[:UserInfo])
    redirect_to sign_up_path if(!@uesr_info.classes  && !params[:action]["sign_up"]) if(@uesr_info)
  end

  # cancan has any err back root_path
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # cancan Ability
  def current_ability
      reset_session if(!@uesr_info)
      @current_ability ||= ::Ability.new(@uesr_info)
  end
  # ---------------

  layout :layout_by_resource
  # layout
  def layout_by_resource
    if params[:controller]["admin"]
      "backend"
    elsif params[:controller]["imsu"]
      "imsu"
    end
  end


  def statistics
    @statistics = {
      :member     => User.where(:role=> ['SU', 'UE']).count,
      :guest      => User.where(:role=> 'GU').count,
      :graduation => User.where(:role=> 'GR').count,
    }
  end
end
