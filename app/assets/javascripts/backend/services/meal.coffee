angular.module('backend').service 'BackendMeal', ($http) ->

  create: (meal) -> $http.post('/api/v1/backend/meals', {meal: meal})