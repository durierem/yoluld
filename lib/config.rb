# frozen_string_literal: true

class Config
  @config = {
    bot_token: ENV['BOT_TOKEN'],
    bot_prefix: ENV['BOT_PREFIX'],
    application_id: ENV['APPLICATION_ID'].to_i
  }

  def self.fetch(key)
    @config.fetch(key)
  end
end
