models = require '../models/models'
Clients = models.Clients
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'
jwt = require 'jsonwebtoken'
crypto = require 'crypto'

config = require '../config/config'
TOKEN_PASSWORD = config.JWT_PASSWORD

module.exports = do ->

  post: (req, res) ->
    email = req.body.email
    password = req.body.password

    Clients.findOne(email: email)
      .then (client) ->
        if not client?
          res.status 404
          res.send 'client not found'
        else
          client = client.toObject()

          hash = crypto
            .createHmac 'sha1', client.salt
            .update password
            .digest 'hex'

          if hash is client.password
            client.isClient = true
            jwt.sign client, TOKEN_PASSWORD, algorithm: 'HS256', (err, token) ->
              res.status 200
              res.send token
          else
            res.status 401
            res.send 'invalid password'
