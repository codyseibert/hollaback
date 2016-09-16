app = require './app'
UsersCtrl = require './controllers/users_controller'
FeaturesCtrl = require './controllers/features_controller'
DocumentsCtrl = require './controllers/documents_controller'
LoginCtrl = require './controllers/login_controller'

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

  app.get '/features', FeaturesCtrl.index
  app.get '/features/:id', FeaturesCtrl.show
  app.post '/features/:id/upvote', FeaturesCtrl.upvote
  app.post '/features', FeaturesCtrl.post
  app.put '/features/:id', FeaturesCtrl.put

  app.post '/documents', upload.single('file'), DocumentsCtrl.post

  # app.post '/login', LoginCtrl.post
