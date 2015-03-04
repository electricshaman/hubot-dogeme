# Description:
#   Wow. Such Doge
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot doge me - Wow. Such Doge
#   hubot doge bomb N - Many Doges. Such exploshun
#
# Author:
#   rowanmanning

module.exports = (robot) ->

  robot.respond /doge me/i, (msg) ->
    msg.http("http://dogeme.rowanmanning.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).doge

  robot.respond /doge bomb( (\d+))?/i, (msg) ->
		limit = 5
    count = msg.match[2] || limit
    msg.http("http://dogeme.rowanmanning.com/bomb?count=" + Math.min(count, limit))
      .get() (err, res, body) ->
        msg.send doge for doge in JSON.parse(body).doges

  robot.respond /how many doges?/i, (msg) ->
    msg.http("http://dogeme.rowanmanning.com/count")
      .get() (err, res, body) ->
        msg.send "There are #{JSON.parse(body).doge_count} doges."
