angular.module('backend').service 'BackendOrder', ($http) ->

  all: -> $http.get("/api/v1/backend/orders")
  find: (id) -> $http.get("/api/v1/backend/orders/#{id}")
  create: (order) -> $http.post("/api/v1/backend/orders", {order: order})
  update: (order) -> $http.patch("/api/v1/backend/orders/#{order.id}", {order: order})