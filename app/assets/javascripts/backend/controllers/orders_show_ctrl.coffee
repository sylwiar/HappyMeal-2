
angular.module('backend').controller 'BackendOrdersShowCtrl', ($scope, BackendOrder, BackendMeal, $state, $stateParams) ->

  BackendOrder.find($stateParams.id).success (response) ->
    $scope.order = response.order


  # $scope.meals = [(name: "Milk", price: 2)]

  $scope.addMeal = ->
    $scope.meals.push
    return

  # $scope.addMeal = ->
  #   BackendMeal.create($scope.meal).success (response) ->
  #     $state.go('backend.orders')

  # $scope.addMeal = ->
  #   $scope.meals.push({name:$scope.mealname, price:$scope.mealprice})