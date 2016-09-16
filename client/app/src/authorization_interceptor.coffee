module.exports = [
  'lodash'
  '$q'
  'TokenService'
  'ApplicationService'
  (
    _
    $q
    TokenService
    ApplicationService
  ) ->

    request: (config) ->
      token = TokenService.getToken()
      config.headers['authorization'] = "Bearer #{token}" if token?
      config.headers['x-application-id'] = ApplicationService.getApplication()
      config
]
