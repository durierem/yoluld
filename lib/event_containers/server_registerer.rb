# frozen_string_literal: true

module ServerRegisterer
  extend Discordrb::EventContainer

  DEFAULT_SETTINGS_VALUES = {
    autojoin: true
  }.freeze

  server_create do |event|
    break unless ServerSettings.find_by(server_id: event.server.id).nil?

    ServerSettings.create(server_id: event.server.id, **DEFAULT_SETTINGS_VALUES)
  end
end
