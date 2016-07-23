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

  .state 'backend.orders.new',
    url: '/orders/new'
    parent: 'backend'
    views:
      'mainView@backend':
        templateUrl: 'backend/orders/form.html'
        controller: 'BackendOrdersNewCtrl'

  .state 'backend.orders.show',
    url: '/orders/:id'
    parent: 'backend'
    views:
      'mainView@backend':
        templateUrl: 'backend/orders/show.html'
        controller: 'BackendOrdersShowCtrl'

  .state 'backend.orders.edit',
    url: '/orders/:id/edit'
    parent: 'backend'
    views:
      'mainView@backend':
        templateUrl: 'backend/orders/form.html'
        controller: 'BackendOrdersEditCtrl'
