mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = new Schema
  clientId: ObjectId
  applicationId: ObjectId
  userGuid: String # used if the user was an annoymous user
  userId: ObjectId
  title: String # MVP
  description: String # MVP
  email: String
  phone: String
  comments: Array # MVP
  upvotes:
    type: Number
    default: 0
  status:
    type: String # MVP
    default: 'open'
  tags: Array # MVP
  # public: Boolean
  # discussion: Array # used to track discussions between administrators
  # documents: Array # used to track uploaded documents attached to this feature
