# Description:
#   Generate Lorem Ipsum from loripsum.net API
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot lorem - Generate Lorem Ipsum - eg: lorem (integer) short|medium|long|verylong decorate link ul ol dl bq code headers allcaps prude plaintext
#
# Author:
#   yves trublin

module.exports = (robot) ->
  robot.hear /lorem( ipsum)? (.*)$/i, (msg) ->
    args = encodeURIComponent(msg.match[2]).split("%20").join("/")
    robot.http("http://loripsum.net/api/#{args}")
      .get() (err, res, body) ->
        msg.send "#{body}"
