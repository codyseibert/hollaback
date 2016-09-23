
module.exports = [
  '$scope'
  '$state'
  'SecurityService'
  'HeaderService'
  (
    $scope
    $state
    SecurityService
    HeaderService
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
