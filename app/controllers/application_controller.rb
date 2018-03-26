class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_location, :logged_in?

  def require_user
    if !logged_in?
      flash[:info] = "Must be logged in to do that."
      redirect_to login_path
    end
  end

  private

  def store_location
    session[:return_to] = request.fullpath if request.get? and controller_name != "sessions"
  end

  def logged_in?
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in?
end
