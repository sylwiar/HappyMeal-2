angular.module('backend').config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise('/orders')

  $stateProvider.state 'orders.index',
    url: '/orders'
    templateUrl: 'backend/orders/index.html'
    controller: 'BackendOrdersIndexCtrl'