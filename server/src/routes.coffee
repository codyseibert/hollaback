app = require './app'
FeaturesCtrl = require './controllers/features_controller'
ApplicationsCtrl = require './controllers/applications_controller'
DocumentsCtrl = require './controllers/documents_controller'

validateUserToken = require './helpers/validate_user_token'

multer = require 'multer'
upload = multer dest: '/tmp'

module.exports = do ->
  app.get '/applications', ApplicationsCtrl.index
  app.post '/applications', ApplicationsCtrl.post
  app.put '/applications/:id', ApplicationsCtrl.put

  app.get '/features', validateUserToken, FeaturesCtrl.index
  app.get '/features/:id', FeaturesCtrl.show
  app.post '/features/:id/upvote', FeaturesCtrl.upvote
  app.post '/features', FeaturesCtrl.post
  app.put '/features/:id', FeaturesCtrl.put

  app.post '/documents', upload.single('file'), DocumentsCtrl.post

  app.post '/validate', (req, res) ->
    res.status 200
    res.send 'valid user'
