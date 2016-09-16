mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = new Schema
  clientId: ObjectId
  email: String
  password: String
  salt: String
