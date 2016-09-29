
module.exports = [
  '$scope'
  '$state'
  '$stateParams'
  'ApplicationService'
  (
    $scope
    $state
    $stateParams
    ApplicationService
  ) ->

    applicationId = $stateParams.applicationId

    ApplicationService.show applicationId
      .then (application) ->
        $scope.application = application

    $scope.save = ->
      ApplicationService.put $scope.application
        .then (application) ->
          $state.go 'applications.show', applicationId: applicationId

    return this

]
