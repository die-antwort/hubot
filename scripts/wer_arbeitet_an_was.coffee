# wer arbeitet an was - zeigt eine Kurzversion unserer Stundenliste

module.exports = (robot) ->
  robot.respond /wer arbeitet(( an)? was|woran)\??$/i, (msg) ->
    msg.http("http://in.die-antwort.eu/statistics/who_works_on_what.text")
      .query(token: process.env.INTRANET_TOKEN)
      .get() (err, res, body) ->
        msg.send body