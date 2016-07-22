angular.module('backend').config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise('/orders')

  $stateProvider.state 'backend',
    abstract: true
    url: ''
    templateUrl: 'backend/layout.html'

  .state 'backend.orders',
    url: '/orders'
    parent: 'backend'
    views:
      'mainView@backend':
        templateUrl: 'backend/orders/list.html'
        controller: 'BackendOrdersIndexCtrl'
