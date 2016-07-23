class ApplicationController < ActionController::Base
  include JsEnv
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
 
  def logged_in?
    !!current_user
  end

  def current_user
    User.first
  end
end