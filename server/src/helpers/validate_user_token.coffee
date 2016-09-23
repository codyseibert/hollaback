Base64 = require('js-base64').Base64
Features = require('../models/models').Features
Applications = require('../models/models').Applications
ObjectId = require('mongoose').Types.ObjectId

request = require 'request'

module.exports = (req, res, next) ->

  applicationId = req.query.applicationId or req.body.applicationId
  if not applicationId?
    res.status 400
    res.send 'missing applicationId from query or body'
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

  if not ObjectId.isValid applicationId
    res.status 400
    res.send 'invalid objectId'
    return

  Applications.findById(applicationId).then (application) ->
    if not application?
      res.status 404
      res.send "application not found with applicationId of #{applicationId}"
    else
      request
        uri: application.validationUrl
        method: "POST"
        json: true
        headers:
          "content-type": "application/json"
        body: token: token
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
          next()
