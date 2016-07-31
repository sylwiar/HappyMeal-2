class ApplicationController < ActionController::Base
  include JsEnv
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :logged_in, :authenticate
 
  private
  def logged_in?
    !!current_user
  end
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    redirect_to root_path if session[:user_id].nil?
  end

  def authenticate
    redirect_to root_path unless User.find(session[:user_id]) if session[:user_id]
  end

end
