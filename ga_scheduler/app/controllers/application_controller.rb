class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged to access this page"
      redirect_to login_path
    end
  end

  # To avoid the Cancan error page
  rescue_from CanCan::AccessDenied do |exception|
   redirect_to root_url , alert: "You can't access this page"
  end

end