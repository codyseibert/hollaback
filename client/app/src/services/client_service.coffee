jwt = require 'jsonwebtoken'

module.exports = [
  'lodash'
  'localStorageService'
  '$http'
  '$q'
  'TokenService'
  'API_PATH'
  (
    _
    localStorageService
    $http
    $q
    TokenService
    API_PATH
  ) ->

    get: (clientId) ->
      $http.get "#{API_PATH}/clients/#{clientId}"
        .then (response) ->
          response.data

    post: (user) ->
      $http.post "#{API_PATH}/clients", user
        .then (response) ->
          response.data

]
