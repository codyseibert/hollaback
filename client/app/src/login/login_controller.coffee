
module.exports = [
  '$scope'
  '$state'
  'SecurityService'
  'HeaderService'
  'TokenService'
  (
    $scope
    $state
    SecurityService
    HeaderService
    TokenService
  ) ->

    $scope.user = {}

    $scope.login = ->
      SecurityService.login $scope.user
        .then (payload) ->
          HeaderService.setApplication null
          $state.go 'applications'
        .catch (err) ->
          console.log 'err', err

    return this

]
