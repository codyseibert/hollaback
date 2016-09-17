module.exports = (
  $stateProvider
  $urlRouterProvider
  $locationProvider
) ->
  $urlRouterProvider.otherwise '/features'

  $locationProvider.html5Mode enabled: true, requireBase: false
  $locationProvider.hashPrefix '!'

  $stateProvider

    .state 'features',
      url: '/features'
      views:
        'main':
          controller: 'FeaturesCtrl'
          templateUrl: '/features/features.html'

    .state 'features.create',
      url: '/create'
      views:
        'main@':
          controller: 'FeaturesCreateCtrl'
          templateUrl: '/features/create/features_create.html'

    .state 'features.show',
      url: '/:id'
      views:
        'main@':
          controller: 'FeaturesShowCtrl'
          templateUrl: '/features/show/features_show.html'

    .state 'error',
      url: '/error'
      params:
        error: null
      views:
        'main@':
          controller: 'ErrorCtrl'
          templateUrl: '/error/error.html'

  return this
