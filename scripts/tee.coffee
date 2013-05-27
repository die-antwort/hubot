# Description
#   Ein Tee-Ziehzeit-Reminder.
#
# Commands
#   hubot erinner mich an [meinen] Tee in <num> [Minuten] - Erinnert in <num> Minuten daran, dass der Tee fertig ist. (Default: 4 Minuten)

DefaultTimeout = 4 # minutes
TeaImg = 'http://farm7.static.flickr.com/6054/6347191874_0a23abccc0_s.jpg'

remind = (msg) ->
  msg.reply "Dein Tee ist fertig! #{TeaImg}"
  
module.exports = (robot) ->
  robot.respond /erinnere? mich an (meinen )?Tee( in (\d+))?/i, (msg) ->
    timeout = msg.match[3] || DefaultTimeout
    msg.send "Okay – ich werde dich in " + timeout + " Minuten daran erinnern, dass dein Tee fertig ist."
    setTimeout (-> remind(msg)), timeout * 1000 * 60
    
  robot.respond /mach mir Tee/i, (msg) ->
    msg.send "Tee machen kann ich leider noch nicht. Aber ich kann dich daran erinnern, wann dein Tee fertig ist. Sag dazu einfach:\n    hubot erinner mich an meinen Tee in 3 Minuten"