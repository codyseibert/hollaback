mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = new Schema
  name: String
  logo: String
  style: String # CSS used to style the page
  email: String
  password: String
  salt: String
  stripeId: String
  verify: String
  verified: Boolean
