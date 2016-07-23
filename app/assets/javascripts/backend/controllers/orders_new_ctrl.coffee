
angular.module('backend').controller 'BackendOrdersNewCtrl', ($scope, BackendOrder, $state) ->
  $scope.order = {}

  $scope.addOrder = ->
    BackendOrder.create($scope.order).success (response) ->
      $state.go('backend.orders')