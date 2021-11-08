# frozen_string_literal: true

unless ENV['BOT_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

class Config
  @config = {
    env: ENV['BOT_ENV'],
    bot_token: ENV['BOT_TOKEN'],
    bot_prefix: ENV['BOT_PREFIX'],
    application_id: ENV['APPLICATION_ID'].to_i
  }

  def self.get(key)
    @config[key]
  end
end
