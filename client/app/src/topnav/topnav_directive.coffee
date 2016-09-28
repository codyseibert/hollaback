module.exports = [
  '$window'
  '$rootScope'
  'TokenService'
  'UserService'
  (
    $window
    $rootScope
    TokenService
    UserService
  ) ->

    restrict: 'E'

    scope: {}

    link: (scope, element, attrs) ->

      scope.isLoggedIn = ->
        TokenService.getToken()?

      scope.isClient = ->
        UserService.isClient()

      # $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      #   if toState.name is 'error'
      #     scope.hide = true
      #   else
      #     scope.hide = false

      scope.application =
        name: 'MyDogLacy'

    templateUrl: '/topnav/topnav.html'
]
