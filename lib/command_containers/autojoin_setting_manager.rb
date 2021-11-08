# frozen_string_literal: true

module AutojoinSettingManager
  extend Discordrb::Commands::CommandContainer

  options = {
    description: 'Manages the autojoin setting.',
    usage: 'autojoin [true|false]',
    arg_types: [TrueClass, FalseClass],
    min_args: 0,
    max_args: 1,
    rescue: 'AutojoinSettingManager failed with: %exception%.'
  }

  command :autojoin, options do |event, arg|
    settings = ServerSettings.find_or_create_by(server_id: event.server.id)

    if arg.nil?
      event.respond("Current autojoin value: **#{settings.autojoin}**")
      break
    end

    settings.autojoin = arg
    if settings.save
      event.respond("Autojoin set to: **#{arg}**")
    else
      event.respond('Failed to change setting')
    end
  end
end
