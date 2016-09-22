models = require '../models/models'
Clients = models.Clients
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'
crypto = require 'crypto'
uuid = require 'node-uuid'
config = require '../config/config'

SALT_ROUNDS = 10

createSalt = ->
  Math.round((new Date().valueOf() * Math.random())) + ''

module.exports = do ->

  post: (req, res) ->
    user = req.body
    salt = createSalt()

    hash = crypto
      .createHmac 'sha1', salt
      .update user.password
      .digest 'hex'

    user.salt = salt
    user.password = hash

    Clients.findOne(email: user.email).then (client) ->
      if client?
        res.status 400
        res.send 'user already exists with this email'
      else
        Clients.create(user).then (obj) ->
          res.status 200
          res.send obj
