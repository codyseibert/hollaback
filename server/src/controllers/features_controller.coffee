models = require '../models/models'
Features = models.Features
Applications = models.Applications
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'
moment = require 'moment'
request = require 'request'
_ =  require 'lodash'

module.exports = do ->

  index: (req, res) ->
    applicationId = req.query.applicationId

    Applications.findById(applicationId).then (application) ->
      if not application?
        res.status 400
        res.send 'application not found'
      else
        Features.find(applicationId: applicationId).then (features) ->
          features = _.map features, (feature) -> feature.toObject()
          request
            uri: application.usersUrl or 'http://localhost:8081/holla/users'
            method: "GET"
            json: true
            headers:
              "content-type": "application/json"
            qs:
              '_id': (_.map features, (feature) ->
                feature.userId
              ).join ','
          , (err, response, users) ->
            if err?
              res.status 400
              res.send 'there was an error hitting the applications usersUrl'
            else
              _.each features, (feature) ->
                user = _.find users, (user) -> "#{user.userId}" is "#{feature.userId}"
                feature.user ?=
                  image: null
                  name: 'Anonymous'
                if user?
                  feature.user.image = user.image
                  feature.user.name = user.name
              res.status 200
              res.send features

  upvote: (req, res) ->
    if not ObjectId.isValid req.params.id
      res.status 404
      res.send 'invalid objectId'
    else
      Features.findById(req.params.id).then (feature) ->
        if not feature?
          res.status 404
          res.send 'no feature was found with the given objectId'
        else
          if (
            _.find feature.upvoteUserIds, (id) ->
              id is req.user.userId
          )?
            res.status 400
            res.send 'you have already upvoted this feature'
          else
            feature.upvoteUserIds.push req.user.userId
            feature.upvotes++
            feature.save().then ->
              res.status 200
              res.send feature

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
    req.body.userId = req.user.userId
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
