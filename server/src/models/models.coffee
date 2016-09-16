mongoose = require 'mongoose'

Users = require './users'
Features = require './features'
Clients = require './clients'
Applications = require './applications'

models =
  Users: mongoose.model 'Users', Users
  Features: mongoose.model 'Features', Features
  Clients: mongoose.model 'Clients', Clients
  Applications: mongoose.model 'Applications', Applications

module.exports = models
