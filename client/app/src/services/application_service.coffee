module.exports = [
  '$http'
  'API_PATH'
  (
    $http
    API_PATH
  ) ->

    index: ->
      $http.get "#{API_PATH}/applications"
        .then (response) ->
          response.data

    show: (id) ->
      $http.get "#{API_PATH}/applications/#{id}"
        .then (response) ->
          response.data

    post: (application) ->
      $http.post "#{API_PATH}/applications", application
        .then (response) ->
          response.data


]
