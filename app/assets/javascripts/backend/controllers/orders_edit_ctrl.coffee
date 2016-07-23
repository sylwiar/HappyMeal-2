
angular.module('backend').controller 'BackendOrdersEditCtrl', ($scope, BackendOrder, $state, $stateParams) ->

  $scope.show = true;

  BackendOrder.find($stateParams.id).success (response) ->
    $scope.order = response.order

  $scope.addOrder = ->
    BackendOrder.update($scope.order).success ->
      $state.go('backend.orders')