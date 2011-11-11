# ?caller=Max+Mustermann&nr=123

HTTP = require "http"
URL = require "url"

Port = 8168

module.exports = (robot) ->
  server = (req, res) ->
    res.writeHead 200, "Content-Type": "text/plain"
    res.end "Hello Worldn\n"
    params = URL.parse(req.url, true).query
    console.log params 
    robot.send null, "Telefon! Es ruft an: #{params.caller} (#{params.nr})"
    
  HTTP.createServer(server).listen Port, "0.0.0.0"
