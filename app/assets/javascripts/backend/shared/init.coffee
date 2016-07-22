angular.module('shared', [
  'ui.router',
  'templates',
  'jmdobry.angular-cache'
]).run ($rootScope, $state, $stateParams) ->
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams

angular.module('shared').config ($provide, $httpProvider, Rails) ->
  if Rails.env != 'development'
    $provide.service '$templateCache', ['$angularCacheFactory', ($angularCacheFactory) ->
      $angularCacheFactory('templateCache', {
        maxAge: 3600000 * 24 * 7,
        storageMode: 'localStorage',
        recycleFreq: 60000
      })
    ]

  $provide.factory 'railsAssetsInterceptor', ['$angularCacheFactory', ($angularCacheFactory) ->
    request: (config) ->
      if assetUrl = Rails.templates[config.url]
        config.url = assetUrl

      config
  ]

  $httpProvider.interceptors.push('railsAssetsInterceptor')
