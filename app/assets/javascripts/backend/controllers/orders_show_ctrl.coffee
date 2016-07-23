
angular.module('backend').controller 'BackendOrdersShowCtrl', ($scope, BackendOrder, BackendMeal, $state, $stateParams) ->

  BackendOrder.find($stateParams.id).success (response) ->
    $scope.order = response.order

  $scope.meal = {}

  $scope.addMeal = ->
    BackendMeal.create($scope.meal).success ->
      $state.go('backend.orders.show')