
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

    console.log 'they are here'

    applicationId = $state.params.id

    ApplicationService.show applicationId
      .then (application) ->
        console.log application
        $scope.application = application

    return this

]
