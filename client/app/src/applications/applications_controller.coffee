
module.exports = [
  '$scope'
  '$state'
  'ApplicationService'
  (
    $scope
    $state
    ApplicationService
  ) ->

    ApplicationService.index()
      .then (applications) ->
        $scope.applications = applications

    return this

]
