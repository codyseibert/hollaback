
module.exports = [
  '$scope'
  '$state'
  'ApplicationService'
  (
    $scope
    $state
    ApplicationService
  ) ->

    $scope.create = ->
      ApplicationService.post $scope.application
        .then (application) ->
          $state.go 'applications.show', applicationId: application._id

    return this

]
