# frozen_string_literal: true

require 'byebug'

module Autojoiner
  extend Discordrb::EventContainer

  voice_state_update from: not!(Config.get(:bot_id)) do |event|
    autojoin = ServerSettings.find_by(server_id: event.server.id).autojoin
    if autojoin && event.bot.voices.empty?
      voice_bot = event.bot.voice_connect(event.channel)
      voice_bot.play_file(File.join(Dir.pwd, 'assets', 'laugh.mp3'))
      voice_bot.destroy
    end
  end
end
