# Description:
#   Shorten URLs with bit.ly & expand detected bit.ly URLs
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_BITLY_ACCESS_TOKEN
#
# Commands:
#   hubot (bitly|shorten) (me) <url> - Shorten the URL using bit.ly
#   http://bit.ly/[hash] - looks up the real url
#
# Author:
#   sleekslush
#   drdamour
#   johnwyles

# A collection of StandUp classes. Essentially a queue.
#
# class StandUps
#   constructor: (@robot) ->
#     @cache = []
#     @currentTimeout = null
#
#     @robot.brain.on 'loaded', =>
#       if @robot.brain.data.standUps
#         @cache = @robot.brain.data.standUps
#         @queue()
#
#   enqueue: (standUp) ->
#     @cache.push standUp
#     @cache.sort (a, b) -> a.at - b.at
#     @robot.brain.data.standUps = @cache
#     @queue()
#
#   dequeue: ->
#     standUp = @cache.shift()
#     @robot.brain.data.standUps = @cache
#     return standUp
#
#   queue: ->
#     clearTimeout @currentTimeout if @currentTimeout
#
#     if @cache.length > 0
#       now = new Date().getTime()
#       @dequeue() until @cache.length is 0 or @cache[0].at > now
#
#       if @cache.length > 0
#         trigger = =>
#           re

module.exports = (robot) ->
  tzOffset = process.env.TIMEZONE or 'America/Los_Angeles'

  # For creating reminders
  robot.respond /((?:remind|tell) (everyone|us|the team|me|(@\w+,?\s?)*) to (?:write|post)\s?(the|their|our|his|her|my)? (?:stand\s?up)(?:s)?) (at (.*))?/i, (res) ->
    recipients = res.match[1]
    time = res.match[5] if res.match.length > 5

    if time
      res.send "OK boss, I'll send out the reminders to #{recipients} at #{time}"
    else
      res.send "What time should I send out the reminders?"
