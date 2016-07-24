
angular.module('backend').controller 'BackendOrdersIndexCtrl', ($scope, BackendOrder, $filter) ->

  $scope.searchBase = {}
  $scope.active_statusOptions = [
    { name: 'All', id: null },
    { name: 'Active', id: 'Active' },
    { name: 'History', id: 'History' }
  ]

  $scope.equalFn = (a,b) ->
    return true if !b
    a == b

  $scope.searchBase.active_status = $scope.active_statusOptions[0]

  $scope.searchParams = ->
    result = {}
    result.active_status = $scope.searchBase.active_status.id
    result

  BackendOrder.all().then (response) ->
    $scope.orders = response.data

