# frozen_string_literal: true

unless ENV['APP_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

require 'discordrb'

config = {
  bot_token: ENV['BOT_TOKEN']
}

bot = Discordrb::Bot.new(token: config[:bot_token])

bot.message(content: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.message(content: '(╯°□°）╯︵ ┻━┻') do |event|
  event.respond '┬─┬ノ( º _ ºノ)'
end

at_exit { bot.stop }
bot.run
