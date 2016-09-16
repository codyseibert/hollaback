module.exports = [
  '$scope'
  '$state'
  'FeatureService'
  (
    $scope
    $state
    FeatureService
  ) ->

    $scope.feature = {}

    $scope.application =
      name: 'Holla Back'

    $scope.submit = ->
      FeatureService.post $scope.feature
        .then (feature) ->
          # TODO: show a thank you modal
          $state.go 'features'

    return this

]
