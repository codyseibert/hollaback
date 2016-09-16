
module.exports = [
  '$scope'
  'FeatureService'
  (
    $scope
    FeatureService
  ) ->

    FeatureService.index()
      .then (features) ->
        $scope.features = features

    return this

]
