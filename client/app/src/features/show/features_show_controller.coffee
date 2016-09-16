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

    featureId = $stateParams.id

    $scope.comments = [
      user: 'Cody Seibert'
      message: 'Instead of having a modal show up, why not use a sidepanel.  A sidepanel could allow the user to easily see their page as they make changes instead of a modal overlaying on top of everything.'
      date: 'March 21, 2016'
    ,
      user: 'Bob Sagot'
      message: 'Yeah, I think a side panel is a better solution than to using a modal.'
      date: 'March 23, 2016'
    ]

    FeatureService.show featureId
      .then (feature) ->
        $scope.feature = feature

    return this

]
