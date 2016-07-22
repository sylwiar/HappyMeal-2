Rails.application.routes.draw do

  mount API::Base => '/api'

  root :to => 'backend/home#index'

end