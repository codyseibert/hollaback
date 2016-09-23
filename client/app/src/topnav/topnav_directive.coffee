module.exports = [
  '$window'
  '$rootScope'
  'TokenService'
  'HeaderService'
  (
    $window
    $rootScope
    TokenService
    HeaderService
  ) ->

    restrict: 'E'

    scope: {}

    link: (scope, element, attrs) ->

      scope.isLoggedIn = ->
        TokenService.getToken()?

      scope.isApplicationView = ->
        HeaderService.getApplication()?

      # $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      #   if toState.name is 'error'
      #     scope.hide = true
      #   else
      #     scope.hide = false

      scope.application =
        name: 'MyDogLacy'

    templateUrl: '/topnav/topnav.html'
]
