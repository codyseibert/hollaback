mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = new Schema
  clientId: ObjectId
  applicationId: ObjectId
  userGuid: String # used if the user was an annoymous user
  userId: ObjectId
  name: String # MVP
  description: String # MVP
  comments: Array # MVP
  upvotes: Number # MVP
  status: String # MVP
  tags: Array # MVP
  # public: Boolean
  # discussion: Array # used to track discussions between administrators
  # documents: Array # used to track uploaded documents attached to this feature
