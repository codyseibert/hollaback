
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

    $scope.upvote = (feature) ->
      FeatureService.upvote feature._id
        .then (f) ->
          feature.upvotes = f.upvotes

    return this

]
