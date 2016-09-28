module.exports = (
  $stateProvider
  $urlRouterProvider
  $locationProvider
) ->
  $urlRouterProvider.otherwise '/features'

  $locationProvider.html5Mode enabled: true, requireBase: false
  $locationProvider.hashPrefix '!'

  $stateProvider

    .state 'applications',
      url: '/applications'
      views:
        'main':
          controller: 'ApplicationsCtrl'
          templateUrl: '/applications/applications.html'

    .state 'applications.create',
      url: '/create'
      views:
        'main@':
          controller: 'ApplicationsCreateCtrl'
          templateUrl: '/applications/create/applications_create.html'

    .state 'applications.show',
      url: '/:applicationId'
      views:
        'main@':
          controller: 'ApplicationsShowCtrl'
          templateUrl: '/applications/show/applications_show.html'

    .state 'features',
      parent: 'applications.show'
      url: '/features'
      views:
        'main@':
          controller: 'FeaturesCtrl'
          templateUrl: '/features/features.html'

    .state 'features.create',
      parent: 'features'
      url: '/create'
      views:
        'main@':
          controller: 'FeaturesCreateCtrl'
          templateUrl: '/features/create/features_create.html'

    .state 'features.show',
      parent: 'features'
      url: '/:featureId'
      views:
        'main@':
          controller: 'FeaturesShowCtrl'
          templateUrl: '/features/show/features_show.html'

    .state 'error',
      url: '/error'
      params:
        error: null
      views:
        'main':
          controller: 'ErrorCtrl'
          templateUrl: '/error/error.html'

    .state 'login',
      url: '/login'
      views:
        'main':
          controller: 'LoginCtrl'
          templateUrl: '/login/login.html'

    .state 'signup',
      url: '/signup'
      views:
        'main':
          controller: 'SignupCtrl'
          templateUrl: '/signup/signup.html'

  return this
