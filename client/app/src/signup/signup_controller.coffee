
module.exports = [
  '$scope'
  '$state'
  'SecurityService'
  'ClientService'
  (
    $scope
    $state
    SecurityService
    ClientService
  ) ->

    $scope.user = {}
    $scope.error = ''

    $scope.register = ->
      $scope.error = ''

      ClientService.post $scope.user
        .then (createdUser) ->
          SecurityService.login $scope.user
            .then (response) ->
              $state.go 'applications'
            .catch (err) ->
              $scope.error = err.data
        .catch (err) ->
          if err.data.name?
            $scope.error = err.data.name
          else
            $scope.error = err.data

    return this

]
