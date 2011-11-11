# mach mir Tee - macht Tee. Oder auch nicht.

timeout = 4 # minutes

remind = (msg) ->
  msg.reply "Dein Tee ist fertig!"
  
module.exports = (robot) ->
  robot.respond /mach mir Tee/i, (msg) ->
    msg.reply "Tee machen kann ich leider noch nicht. Aber ich werde dich in " + timeout + " Minuten daran erinnern, dass dein Tee fertig ist."
    setTimeout (-> remind(msg)), timeout * 1000 * 60