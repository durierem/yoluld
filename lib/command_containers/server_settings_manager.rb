# frozen_string_literal: true

module ServerSettingsManager
  extend Discordrb::Commands::CommandContainer

  show_attributes = {
    description: 'Shows settings value.',
    usage: 'show SETTING_NAME',
    arg_types: [String],
    min_args: 1,
    max_args: 1,
    rescue: 'ServerSettingsManager failed with: %exception%.'
  }

  command :show, show_attributes do |event, setting_name|
    settings = ServerSettings.find_or_create_by(server_id: event.server.id)
    if settings.respond_to?(setting_name)
      value = settings.public_send(setting_name)
      event.respond("Current #{setting_name} value: `#{value}`")
    else
      event.respond("Unrecognised setting name: `#{setting_name}`")
    end
  end

  set_attributes = {
    description: 'Sets settings value.',
    usage: 'set SETTING_NAME NEW_VALUE',
    min_args: 2,
    max_args: 2,
    rescue: 'ServerSettingsManager failed with: %exception%.'
  }

  command :set, set_attributes do |event, *command_args|
    setting_name, setting_arg = *command_args
    settings = ServerSettings.find_or_create_by(server_id: event.server.id)

    begin
      settings.public_send("#{setting_name}=", setting_arg)
      if settings.save
        event.respond("Setting `#{setting_name}` set to: `#{arg}`")
      else
        event.respond("Failed to update setting: `#{setting_name}`")
      end
    rescue NoMethodError
      event.respond("Unrecognised setting name: `#{setting_name}`")
    rescue ArgumentError
      event.respond("Invalid argument: `#{setting_arg}`")
    end
  end
end
