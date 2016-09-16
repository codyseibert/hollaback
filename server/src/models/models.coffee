mongoose = require 'mongoose'

Users = require './users'
Features = require './features'
Clients = require './clients'

models =
  Users: mongoose.model 'Users', Users
  Features: mongoose.model 'Features', Features
  Clients: mongoose.model 'Clients', Clients

module.exports = models
