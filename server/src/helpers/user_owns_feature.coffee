Base64 = require('js-base64').Base64
Features = require('../models/models').Features

module.exports = (req, res, next) ->

  featureId = req.params.id

  Features.findById(featureId).then (feature) ->
    if not feature?
      res.status 404
      res.send 'feature not found with id'
    else if "#{feature.userId}" isnt "#{req.user._id}"
      res.status 400
      res.send 'You do not have access to this feature'
    else
      next()
