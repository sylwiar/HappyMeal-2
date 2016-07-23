
angular.module('backend').controller 'BackendMealsNewCtrl', ($scope, BackendMeal, $state) ->
  $scope.meal = {}

  $scope.addMeal = ->
    BackendMeal.create($scope.meal).success ->
      $state.go('backend.orders.show')
