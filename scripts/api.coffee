# Description
#   Mini-API, um Hubot beliebige Messages sagen lassen zu können.
#   /message?text=Das+soll+Hubot+im+Chat+sagen

URL = require "url"

module.exports = (robot) ->
  robot.router.get "/message", (req, res) ->
    res.writeHead 200, "Content-Type": "text/plain"
    res.end "OK\n"
    params = URL.parse(req.url, true).query
    robot.send {}, params.text if params.text
