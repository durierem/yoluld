# frozen_string_literal: true

require 'discordrb'
require_relative 'lib/config'

config = Config.load
bot = Discordrb::Commands::CommandBot.new(
  token: config[:bot_token],
  prefix: config[:bot_prefix]
)

bot.command(:ping, description: 'You alive dude?') do |event|
  event.respond("Pong! (#{((Time.now - event.timestamp) * 1000).round} ms)")
end

bot.message(content: '(╯°□°）╯︵ ┻━┻') do |event|
  event.respond '┬─┬ノ( º _ ºノ)'
end

bot.voice_state_update(
  from: not!(config[:bot_id]),
  self_mute: false,
  self_deaf: false
) do |event|
  if bot.voices.empty?
    voice_bot = bot.voice_connect(event.channel)
    voice_bot.play_file('./assets/laugh.mp3')
    voice_bot.destroy
  end
end

at_exit { bot.stop }
bot.run
