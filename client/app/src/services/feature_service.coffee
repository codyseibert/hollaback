module.exports = [
  '$http'
  'API_PATH'
  (
    $http
    API_PATH
  ) ->

    index: (id) ->
      $http.get "#{API_PATH}/features"
        .then (response) ->
          response.data

    show: (id) ->
      $http.get "#{API_PATH}/features/#{id}"
        .then (response) ->
          response.data

    post: (feature) ->
      $http.post "#{API_PATH}/features", feature
        .then (response) ->
          response.data

    put: (feature) ->
      $http.put "#{API_PATH}/features/#{feature._id}", feature
        .then (response) ->
          response.data

    delete: (feature) ->
      $http.delete "#{API_PATH}/features/#{feature._id}"
        .then (response) ->
          response.data

]
