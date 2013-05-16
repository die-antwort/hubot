# Description
#   Zugriff auf die Stundenliste in unserem Intranet
#
# Commands
#   hubot wer arbeitet an was - Zeigt eine Kurzversion unserer Stundenliste

module.exports = (robot) ->
  robot.respond /wer arbeitet(( an)? was|woran)\??$/i, (msg) ->
    robot.http("http://in.die-antwort.eu/statistics/who_works_on_what.text")
      .query(token: process.env.INTRANET_TOKEN)
      .get() (err, res, body) ->
        msg.send body