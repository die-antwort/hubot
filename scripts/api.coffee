
# Startet einen HTTP-Server und bietet ein Mini-API an: 
# /?msg=Das+soll+Hubot+im+Chat+sagen
#
# (erste Zeile im File leer lassen, damit dieser Kommentar nicht bei "hubot help" angezeigt wird.)

URL = require "url"

module.exports = (robot) ->
  robot.router.get "/", (req, res) ->
    res.writeHead 200, "Content-Type": "text/plain"
    res.end "OK\n"
    params = URL.parse(req.url, true).query
    user = robot.userForName("Hubot")

    # TODO: Warum müssen wir das hier setzen? (Wenn wir's nicht tun kommt ein Fehler in Session.send)
    user.flow = "die-antwort:main"
    
    robot.send user, params.msg
