# frozen_string_literal: true

module Autojoiner
  extend Discordrb::EventContainer

  class Handler
    def initialize(event)
      @event = event
    end

    def call
      return unless can_join?

      voice_bot = @event.bot.voice_connect(@event.channel)
      voice_bot.play_file(File.join(Dir.pwd, 'assets', 'laugh.mp3'))
    end

    private

    def can_join?
      return false if @event.user.bot_account
      return false unless @event.bot.voices.empty?
      return false unless @event.old_channel.nil?

      settings = ServerSettings.find_or_create_by(server_id: @event.server.id)
      return false unless settings.autojoin

      true
    end
  end

  voice_state_update do |event|
    Handler.new(event).call
  end
end
