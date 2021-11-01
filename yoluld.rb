# frozen_string_literal: true

require 'discordrb'
require_relative 'lib/config'

config = Config.load
bot = Discordrb::Commands::CommandBot.new(
  token: config[:bot_token],
  prefix: config[:bot_prefix]
)

bot.command :ping do |event|
  event.respond("Pong! (#{((Time.now - event.timestamp) * 1000).round} ms)")
end

bot.message(content: '(╯°□°）╯︵ ┻━┻') do |event|
  event.respond '┬─┬ノ( º _ ºノ)'
end

at_exit { bot.stop }
bot.run
