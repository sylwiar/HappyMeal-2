
angular.module('backend').controller 'BackendOrdersShowCtrl', ($scope, BackendOrder, $state, $stateParams) ->

  BackendOrder.find($stateParams.id).success (response) ->
    $scope.order = response.order