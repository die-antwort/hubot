# Description
#   Infos von der Bürocam
#
# Configuration:
#   BUEROCAM_TOKEN
#
# Commands
#   hubot was macht die bürocam? – Zeigt das letzte Foto und Stats von der Bürocam.

module.exports = (robot) ->
  robot.respond /was macht die b(ü|ue)rocam\?/i, (msg) ->
    robot.http("http://buerocam.die-antwort.eu/api.php")
      .query(token: process.env.BUEROCAM_TOKEN)
      .get() (err, res, body) ->
        data = JSON.parse(body)
        text = "Die Bürocam hat in den letzten 24h #{data.photo_count_for_last_24h} Fotos gemacht (und #{data.photo_count_for_last_7d} in der letzten Woche), hier das neueste: #{data.latest_photo_url}\nMehr aktuelle Fotos gibts hier: #{data.latest_photos_url}"
        msg.send text