angular.module('backend').service 'BackendOrder', ($http) ->

  all: -> $http.get("/api/v1/backend/orders")
  find: (id) -> $http.get("/api/v1/backend/orders/#{id}")
