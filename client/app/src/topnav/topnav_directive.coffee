module.exports = [
  '$window'
  ($window) ->

    restrict: 'E'

    scope: {}

    link: (scope, element, attrs) ->
      scope.application =
        name: 'MyDogLacy'

    templateUrl: '/topnav/topnav.html'
]
