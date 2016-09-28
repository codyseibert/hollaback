models = require '../models/models'
Applications = models.Applications
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'
config = require '../config/config'

module.exports = do ->

  index: (req, res) ->
    client = req.client
    Applications.find(clientId: new ObjectId(client._id)).then (applications) ->
      res.status 200
      res.send applications

  show: (req, res) ->
    Applications.findById(req.params.id).then (application) ->
      if not application?
        res.status 404
        res.send 'application not found'
      else
        res.status 200
        res.send application

  post: (req, res) ->
    req.body.clientId = req.client._id
    Applications.create(req.body).then (application) ->
      res.status 200
      res.send application

  put: (req, res) ->
    Applications.update(_id: new ObjectId(req.params.id), req.body).then (application) ->
      res.status 200
      res.send application
