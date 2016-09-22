module.exports = [
  'lodash'
  '$q'
  'TokenService'
  'HeaderService'
  (
    _
    $q
    TokenService
    HeaderService
  ) ->

    request: (config) ->
      token = TokenService.getToken()
      config.headers['authorization'] = "Bearer #{token}" if token?
      config.headers['x-application-id'] = HeaderService.getApplication()
      config
]
