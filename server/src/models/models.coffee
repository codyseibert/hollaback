mongoose = require 'mongoose'

Features = require './features'
Clients = require './clients'
Applications = require './applications'

models =
  Features: mongoose.model 'Features', Features
  Clients: mongoose.model 'Clients', Clients
  Applications: mongoose.model 'Applications', Applications

module.exports = models
