app = require './app'
UsersCtrl = require './controllers/users_controller'
FeaturesCtrl = require './controllers/features_controller'
ApplicationsCtrl = require './controllers/applications_controller'
DocumentsCtrl = require './controllers/documents_controller'
LoginCtrl = require './controllers/login_controller'

validateUserToken = require './helpers/validate_user_token'

# userIsLoggedIn = require './helpers/user_is_logged_in'
# userOwnsPet = require './helpers/user_owns_pet'
# injectUser = require './helpers/inject_user'

multer = require 'multer'
upload = multer dest: '/tmp'

module.exports = do ->
  # app.get '/users', UsersCtrl.index
  # app.get '/users/:id', userIsLoggedIn, UsersCtrl.show
  # app.post '/users', UsersCtrl.post
  # app.put '/users/:id', userIsLoggedIn, UsersCtrl.put

  # app.post '/verify', UsersCtrl.verify

  # app.get '/applications/:id', ApplicationsCtrl.show
  app.get '/applications', ApplicationsCtrl.index
  app.post '/applications', ApplicationsCtrl.post

  app.get '/features', validateUserToken, FeaturesCtrl.index
  app.get '/features/:id', FeaturesCtrl.show
  app.post '/features/:id/upvote', FeaturesCtrl.upvote
  app.post '/features', FeaturesCtrl.post
  app.put '/features/:id', FeaturesCtrl.put

  app.post '/documents', upload.single('file'), DocumentsCtrl.post

  app.post '/validate', (req, res) ->
    res.status 200
    res.send 'valid user'

  # app.post '/login', LoginCtrl.post
