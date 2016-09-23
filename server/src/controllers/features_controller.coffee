models = require '../models/models'
Features = models.Features
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'
moment = require 'moment'

module.exports = do ->

  index: (req, res) ->
    Features.find(req.query).then (collection) ->
      res.status 200
      res.send collection

  upvote: (req, res) ->
    if not ObjectId.isValid req.params.id
      res.status 404
      res.send 'invalid objectId'
      return

    Features.findById(req.params.id).then (obj) ->
      if not obj?
        res.status 404
        res.send 'no feature was found with the given objectId'
      else
        obj.upvotes ?= 0
        obj.upvotes++
        obj.save().then ->
          res.status 200
          res.send obj

  show: (req, res) ->
    if not ObjectId.isValid req.params.id
      res.status 404
      res.send 'invalid objectId'
      return

    Features.findById(req.params.id).then (obj) ->
      if not obj?
        res.status 404
        res.send 'no feature was found with the given objectId'
      else
        res.status 200
        res.send obj

  post: (req, res) ->
    Features.create(req.body)
      .then (obj) ->
        res.status 200
        res.send obj
      .catch (err) ->
        res.status 400
        res.send 'feature already exists'

  put: (req, res) ->
    featureId = new ObjectId req.params.id
    Features.update(_id: featureId, req.body).then (obj) ->
      res.status 200
      res.send obj

  destroy: (req, res) ->
    Features.findById(req.params.id).remove().then (obj) ->
      res.status 200
      res.send obj
