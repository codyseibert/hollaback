
module.exports = [
  '$scope'
  '$state'
  'FeatureService'
  (
    $scope
    $state
    FeatureService
  ) ->

    FeatureService.index()
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
