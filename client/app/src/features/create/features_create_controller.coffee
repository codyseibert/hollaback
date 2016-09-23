module.exports = [
  '$scope'
  '$state'
  '$stateParams'
  'FeatureService'
  (
    $scope
    $state
    $stateParams
    FeatureService
  ) ->

    applicationId = $stateParams.applicationId

    $scope.feature = {}
    $scope.feature.applicationId = applicationId

    $scope.application =
      name: 'Holla Back'

    $scope.submit = ->
      FeatureService.post $scope.feature
        .then (feature) ->
          $state.go 'features', applicationId: applicationId

    return this

]
