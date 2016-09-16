models = require '../models/models'
Features = models.Features
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'
moment = require 'moment'

module.exports = do ->

  index: (req, res) ->
    # query = req.query
    # if req.query['_id$in']
    #   query =
    #     '_id':
    #       $in: req.query['_id$in'].split ','
    Features.find().then (collection) ->
      res.status 200
      res.send collection

  show: (req, res) ->
    if not ObjectId.isValid req.params.id
      res.status 404
      res.send 'invalid object id'
      return

    Features.findById(req.params.id).then (obj) ->
      if not obj?
        res.status 404
        res.send 'no pet found with the given id'
      else if req.user?._id? and "#{obj.userId}" is "#{req.user._id}"
        res.status 200
        res.send obj
      else if not obj.activeUntil? or not moment().isBefore(moment(obj.activeUntil))
        res.status 400
        res.send 'pet is not published'
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
