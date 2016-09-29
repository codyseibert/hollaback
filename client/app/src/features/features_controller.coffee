
module.exports = [
  '$scope'
  '$state'
  '$stateParams'
  'FeatureService'
  'UserService'
  'lodash'
  (
    $scope
    $state
    $stateParams
    FeatureService
    UserService
    _
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
          feature.upvoteUserIds.push UserService.getUser()._id

    $scope.hasVoted = (feature) ->
      _.find(feature.upvoteUserIds, (user) -> user is UserService.getUser()._id)?

    return this

]
