# Respond to greetings

module.exports = (robot) ->
  robot.enter (msg) ->
    msg.send "Hallo!"

  robot.hear /^(hallo|hi|hey|guten morgen)/i, (msg) ->
    username = msg.message.user?.name
    return if username == "Hubot" # Hubot shouldn't greet himself.
    hour = new Date().getHours()
    greeting = if 6 <= hour < 12
      "Guten Morgen, #{username}!" 
    else if 12 <= hour < 18
      "Hallo #{username}!"
    else if 18 <= hour < 24
      "Guten Abend, #{username}!"
    else
      "Um diese Uhrzeit, #{username}? Das ist nicht dein Ernst, oder?"
    msg.send greeting