
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

    $scope.applicationId = $stateParams.applicationId

    FeatureService.index applicationId: $scope.applicationId
      .then (features) ->
        $scope.features = features
      .catch (err) ->
        $state.go 'error', error: err.data

    $scope.upvote = (feature) ->
      FeatureService.upvote feature._id
        .then (f) ->
          feature.upvotes = f.upvotes

    return this

]
