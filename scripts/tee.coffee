# mach mir Tee [in <num> [Minuten]]- Erinnert an fertigen Tee in <num> (Default: 4) Minuten

defaultTimeout = 4 # minutes

remind = (msg) ->
  msg.reply "Dein Tee ist fertig!"
  
module.exports = (robot) ->
  robot.respond /mach mir Tee( in (\d+))?/i, (msg) ->
    timeout = msg.match[2] || defaultTimeout
    msg.send "Tee machen kann ich leider noch nicht. Aber ich werde dich in " + timeout + " Minuten daran erinnern, dass dein Tee fertig ist."
    setTimeout (-> remind(msg)), timeout * 1000 * 60