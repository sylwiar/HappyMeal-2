Rails.application.routes.draw do

  mount API::Base => '/api'

  root :to => 'backend/home#index'

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

end