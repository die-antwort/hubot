# mach mir Tee [in <num> [Minuten]]- Erinnert an fertigen Tee in <num> (Default: 4) Minuten

DefaultTimeout = 4 # minutes
TeaImg = 'http://farm7.static.flickr.com/6054/6347191874_0a23abccc0_s.jpg'

remind = (msg) ->
  msg.reply "Dein Tee ist fertig! #{TeaImg}"
  
module.exports = (robot) ->
  robot.respond /mach mir Tee( in (\d+))?/i, (msg) ->
    timeout = msg.match[2] || DefaultTimeout
    msg.send "Tee machen kann ich leider noch nicht. Aber ich werde dich in " + timeout + " Minuten daran erinnern, dass dein Tee fertig ist."
    setTimeout (-> remind(msg)), timeout * 1000 * 60