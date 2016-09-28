models = require '../models/models'
Clients = models.Clients
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'
crypto = require 'crypto'
uuid = require 'node-uuid'
config = require '../config/config'
Joi = require 'joi'


SALT_ROUNDS = 10

createSalt = ->
  Math.round((new Date().valueOf() * Math.random())) + ''

module.exports = do ->

  post: (req, res) ->
    schema = Joi.object().keys
      email: Joi.string().required()
      password: Joi.string().required()
      repeat: Joi.string().required()

    Joi.validate req.body, schema, (err, value) ->
      if err?
        res.status 400
        res.send err
      else
        registrationInfo = value
        salt = createSalt()

        hash = crypto
          .createHmac 'sha1', salt
          .update registrationInfo.password
          .digest 'hex'

        registrationInfo.salt = salt
        registrationInfo.password = hash

        Clients.findOne(email: registrationInfo.email).then (client) ->
          if client?
            res.status 400
            res.send 'client already exists with this email'
          else
            Clients.create(registrationInfo).then (obj) ->
              res.status 200
              res.send obj
