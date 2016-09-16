module.exports = [
  'lodash'
  '$q'
  'localStorageService'
  (
    _
    $q
    localStorageService
  ) ->

    application = localStorageService.get 'application'

    getApplication: ->
      application

    setApplication: (app) ->
      application = app
      localStorageService.set 'application', app
      if not app?
        localStorageService.remove 'application'

]
