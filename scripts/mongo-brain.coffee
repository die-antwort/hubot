# Description:
#  Enhances hubot-brain with MongoDB. Useful for Heroku accounts that want
#  better persistance. Falls back to memory brain if Mongo connection fails
#  for local testing.
#
# Dependencies:
#   "mongodb": ">= 1.2.0"
#
# Configuration:
#   MONGODB_HOST
#   MONGODB_PORT
#   MONGODB_DB
#
# Commands:
#   None
#
# Author:
#   ajacksified


mongodb = require "mongodb"
Server = mongodb.Server
Collection = mongodb.Collection
Db = mongodb.Db

module.exports = (robot) ->
  host = process.env.MONGODB_HOST || "localhost"
  port = process.env.MONGODB_PORT || "27017"
  dbname = process.env.MONGODB_DB || "hubot"

  error = (err) ->
    console.log "==MONGO BRAIN UNAVAILABLE==\n==SWITCHING TO MEMORY BRAIN=="
    console.log err
    robot.brain.emit 'loaded', {}

  server = new Server(host, port, { })
  db = new Db(dbname, server, { w: 1, native_parser: true })

  db.open (err, client) ->
    if err
      error(err)
    else
      collection = new Collection(client, 'hubot_storage')
      collection.find().limit(1).toArray (err, results) ->
        if err
          throw err
        else if results
          robot.brain.mergeData results[0]
        else
          robot.logger.info "Initializing new mongo-brain storage"
          robot.brain.mergeData {}

      robot.brain.on 'save', () ->
        collection.save robot.brain.data, (err) ->
          console.warn err if err?
