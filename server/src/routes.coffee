app = require './app'
FeaturesCtrl = require './controllers/features_controller'
ApplicationsCtrl = require './controllers/applications_controller'
DocumentsCtrl = require './controllers/documents_controller'
ClientsCtrl = require './controllers/clients_controller'
LoginCtrl = require './controllers/login_controller'

validateUserToken = require './helpers/validate_user_token'
validateClientToken = require './helpers/validate_client_token'
hasAccessToApplication = require './helpers/has_access_to_application'

multer = require 'multer'
upload = multer dest: '/tmp'

module.exports = do ->

  app.post '/login', LoginCtrl.post

  app.post '/clients', ClientsCtrl.post

  app.get '/applications', validateClientToken, ApplicationsCtrl.index

  app.get '/applications/:id', validateClientToken, ApplicationsCtrl.show

  # TODO: Validate the user logged in is a client
  app.post '/applications', validateClientToken, ApplicationsCtrl.post

  # TODO: Validate the user logged in is a client and has access to the application
  app.put '/applications/:id', ApplicationsCtrl.put

  # TODO: Validate the user logged in has access to the application provided in the header
  app.get '/features', validateUserToken, FeaturesCtrl.index

  # TODO: Validate the user logged in has access to the application provided in the header
  app.get '/features/:id', FeaturesCtrl.show

  # TODO: A user can upload a feature only once
  # app.post '/features/:id/upvote', FeaturesCtrl.upvote
  app.post '/features', FeaturesCtrl.post

  # TODO: Validate the user owns the feature
  app.put '/features/:id', FeaturesCtrl.put

  # TODO: Validate the user is logged in and has access to the application provided in the header
  app.post '/documents', upload.single('file'), DocumentsCtrl.post
