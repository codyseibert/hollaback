Base64 = require('js-base64').Base64
Applications = require('../models/models').Applications
Features = require('../models/models').Features
ObjectId = require('mongoose').Types.ObjectId

request = require 'request'

module.exports = (req, res, next) ->

  applicationId = req.params.id

  Applications.findById(applicationId)
    .then (application) ->
      if not application?
        res.status 404
        res.send "application not found with applicationId of #{feature.applicationId}"
      else
        if "#{application.clientId}" isnt "#{req.client._id}"
          res.status 401
          res.send 'this client has no access to this application'
        else
          next()
