Base64 = require('js-base64').Base64
jwt = require 'jsonwebtoken'

config = require '../config/config'
TOKEN_PASSWORD = config.JWT_PASSWORD

module.exports = (req, res, next) ->
  auth = req.headers.authorization
  try
    token = auth.split(' ')[1]
    jwt.verify token, TOKEN_PASSWORD, (err, decoded) ->
      if err?
        res.status 400
        res.send 'invalid client token'
      else
        req.client = decoded._doc
        next()
  catch err
    res.status 401
    res.send 'missing authorization header'
