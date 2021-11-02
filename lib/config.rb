# frozen_string_literal: true

unless ENV['APP_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

class Config < Hash
  def self.load
    new.merge(
      env: ENV['APP_ENV'],
      bot_token: ENV['BOT_TOKEN'],
      bot_prefix: ENV['BOT_PREFIX'],
      bot_id: ENV['BOT_ID'].to_i
    )
  end
end
