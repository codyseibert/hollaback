mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = new Schema
  clientId: ObjectId
  name: String
  logo: String
  style: String # CSS used to style the page
