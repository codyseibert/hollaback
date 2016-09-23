
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

    $scope.applicationId = $state.params.applicationId

    ApplicationService.show $scope.applicationId
      .then (application) ->
        $scope.application = application

    return this

]
