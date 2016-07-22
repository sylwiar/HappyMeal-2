
angular.module('backend').controller 'BackendOrdersIndexCtrl', ($scope, BackendOrder, $filter) ->

  BackendOrder.all().then (response) ->
    $scope.orders = response.data