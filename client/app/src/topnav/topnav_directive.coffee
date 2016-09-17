module.exports = [
  '$window'
  '$rootScope'
  (
    $window
    $rootScope
  ) ->

    restrict: 'E'

    scope: {}

    link: (scope, element, attrs) ->

      $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
        if toState.name is 'error'
          scope.hide = true
        else
          scope.hide = false

      scope.application =
        name: 'MyDogLacy'

    templateUrl: '/topnav/topnav.html'
]
