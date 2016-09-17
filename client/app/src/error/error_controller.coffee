
module.exports = [
  '$scope'
  '$stateParams'
  (
    $scope
    $stateParams
  ) ->

    $scope.error = $stateParams.error

    return this

]
