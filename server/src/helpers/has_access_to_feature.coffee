Base64 = require('js-base64').Base64
Applications = require('../models/models').Applications
Features = require('../models/models').Features
ObjectId = require('mongoose').Types.ObjectId

request = require 'request'

module.exports = (req, res, next) ->

  featureId = req.params.id
  if not featureId?
    res.status 400
    res.send 'missing featureId from params'
    return

  token = req.headers['authorization']
  if not token?
    res.status 404
    res.send 'missing "Authorization" token'
    return

  try
    token = token.split(' ')[1]
  catch err
    res.status 400
    res.send 'malformed "Authorization" header'
    return

  Features.findById(featureId).then (feature) ->
    if not feature?
      res.status 404
      res.send "feature not found with featureId of #{featureId}"
    else
      Applications.findById(feature.applicationId)
        .then (application) ->
          if not application?
            res.status 404
            res.send "application not found with applicationId of #{feature.applicationId}"
          else
            request
              uri: application.validationUrl
              method: "POST"
              json: true
              headers:
                "content-type": "application/json"
              body:
                token: token
            , (err, response, body) ->
              if err?
                res.status 400
                res.send 'there was an error hitting the applications validationUrl'
              else if response.statusCode is 403
                res.status 403
                res.send 'invalid token'
              else if response.statusCode isnt 200
                res.status 403
                res.send 'validation failed'
              else
                console.log 'user', body
                req.user = body
                next()
