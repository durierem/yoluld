# frozen_string_literal: true

require 'discordrb'

require_relative 'lib/config'
require_relative 'lib/mongoidal'
require_relative 'lib/server_settings'
require_relative 'lib/command_containers/pinger'
require_relative 'lib/command_containers/autojoin_setting_manager'
require_relative 'lib/event_containers/autojoiner'

bot = Discordrb::Commands::CommandBot.new(
  token: Config.get(:bot_token),
  prefix: Config.get(:bot_prefix)
)

# MESSAGES

bot.message(content: '(╯°□°）╯︵ ┻━┻') do |event|
  event.respond '┬─┬ノ( º _ ºノ)'
end

# COMMANDS

bot.include! Pinger
bot.include! AutojoinSettingManager

# EVENTS

bot.include! Autojoiner

# Display the bot invite url for convenience
puts bot.invite_url

# Start the bot
at_exit { bot.stop }
bot.run
