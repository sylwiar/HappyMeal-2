
angular.module('backend').controller 'BackendOrdersIndexCtrl', ($scope, BackendOrder, $filter) ->

  $scope.searchBase = {}
  $scope.statusOptions = [
    { name: 'Wszystkie', id: null },
    { name: 'Active', id: 'active' },
    { name: 'History', id: 'history' }
  ]

  $scope.equalFn = (a,b) ->
    console.log a
    console.log b
    return true if !b
    a == b

  $scope.searchBase.status = $scope.statusOptions[0]

  $scope.searchParams = ->
    result = {}
    result.status = $scope.searchBase.status.id
    result

  BackendOrder.all().then (response) ->
    $scope.orders = response.data