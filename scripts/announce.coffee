# Description:
#   Send messages to several flows
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_ANNOUNCE_FLOWS - comma-separated list of flows
#
# Commands:
#   hubot announce: <message> - Sends a message to all configured flows.

module.exports = (robot) ->

  if process.env.HUBOT_ANNOUNCE_FLOWS
    allFlows = process.env.HUBOT_ANNOUNCE_FLOWS.split(',')
  else
    allFlows = []

  robot.respond /announce: (.*)/i, (msg) ->
    announcement = msg.match[1]
    text = "★ Durchsage von #{msg.message.user.name}: ★\n#{announcement}"
    for flow in allFlows
      robot.send {flow: flow}, text
