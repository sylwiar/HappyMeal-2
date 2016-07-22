class ApplicationController < ActionController::Base
  include JsEnv
  protect_from_forgery with: :exception
end