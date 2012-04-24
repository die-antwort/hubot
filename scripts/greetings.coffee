# Respond to greetings

module.exports = (robot) ->
  respondTo = (regex, handler) ->
    robot.hear regex, (msg) ->
      name = msg.message.user.name
      return if name == "Hubot"
      msg.send handler(name)
      
  respondTo /^(hallo|hi|hey|guten morgen)/i, (name) ->
    hour = new Date().getHours()
    if 6 <= hour < 12
      "Guten Morgen, #{name}!" 
    else if 12 <= hour < 18
      "Hallo #{name}!"
    else if 18 <= hour < 24
      "Guten Abend, #{name}!"
    else
      "Um diese Uhrzeit, #{name}? Das ist nicht dein Ernst, oder?"
    
  respondTo /^re/i, (name) ->
    "Willkommen zurück, #{name}!"
    
  respondTo /^mahlzeit/i, (name) ->
    "Mahlzeit!"