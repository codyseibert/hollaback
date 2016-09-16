angular = require 'angular'
require 'angular-scroll'
require 'angular-filter'
require 'angular-local-storage'
require 'angular-animate'
require 'ng-lodash'
require '../../node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls'
require '../../node_modules/textangular/dist/textAngular-rangy.min'
require '../../node_modules/textangular/dist/textAngular-sanitize.min'
require '../../node_modules/textangular/dist/textAngular.min'
require 'ng-file-upload'
require 'angular-confirm'
require 'angular-deckgrid'
require '@iamadamjowett/angular-click-outside'
require 'angular-inview'

require 'autotrack'

ga 'create', 'UA-77135326-2', 'auto'

ga 'require', 'cleanUrlTracker'
ga 'require', 'eventTracker'
ga 'require', 'urlChangeTracker'

ga 'send', 'pageview'

app = require('angular').module('hollaback', [
  require 'angular-ui-router'
  require 'angular-resource'
  'angular-click-outside'
  'ngAnimate'
  'textAngular'
  'duScroll'
  'angular.filter'
  'ngFileUpload'
  'LocalStorageModule'
  'ngLodash'
  'ui.bootstrap'
  'angular-confirm'
  'akoenig.deckgrid'
  'angular-inview'
  require 'angular-moment'
])

app.factory 'AuthorizationInterceptor', require './authorization_interceptor'


app.config require './routes'
app.config [
  'localStorageServiceProvider'
  (
    localStorageServiceProvider
  ) ->

    localStorageServiceProvider
      .setPrefix 'hollaback'
]
app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.interceptors.push 'AuthorizationInterceptor'
]

require './features'
require './services'

app.constant 'API_PATH', 'http://localhost:8081'

app.run [
  (
  ) ->

]
