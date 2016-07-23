
angular.module('backend').controller 'BackendOrdersIndexCtrl', ($scope, BackendOrder, $filter) ->

  $scope.searchBase = {}
  $scope.statusOptions = [
    { name: 'Active', id: null },
    { name: 'History', id: 'history' }
  ]

  $scope.equalFn = (a,b) ->
    return true if !b
    a == b

  $scope.searchBase.status = $scope.statusOptions[0]

  $scope.searchParams = ->
    result = {}
    result.status = $scope.searchBase.status.id
    result

  BackendOrder.all().then (response) ->
    $scope.orders = response.data