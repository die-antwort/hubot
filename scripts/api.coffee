# Startet einen HTTP-Server und bietet ein Mini-API an:
# /?msg=Das+soll+Hubot+im+Chat+sagen

HTTP = require "http"
URL = require "url"

Port = 1337

module.exports = (robot) ->
  server = (req, res) ->
    res.writeHead 200, "Content-Type": "text/plain"
    res.end "OK\n"
    params = URL.parse(req.url, true).query
    robot.send robot.userForName("Hubot"), params.msg
    
  HTTP.createServer(server).listen Port, "127.0.0.1"
