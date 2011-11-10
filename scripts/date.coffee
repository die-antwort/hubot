# Generates help commands for Hubot.
#
# These commands are grabbed from comment blocks at the top of each file.
#
# date - Displays current date.

module.exports = (robot) ->
  robot.respond /date$/i, (msg) ->
    msg.send "Heute ist der ..."

