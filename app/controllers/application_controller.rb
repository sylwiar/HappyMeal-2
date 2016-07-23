class ApplicationController < ActionController::Base
  include JsEnv
  protect_from_forgery with: :exception
  helper_method :current_user
 
  def current_user
    User.first
  end
end