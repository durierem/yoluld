# frozen_string_literal: true

unless ENV['APP_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

class Config < OpenStruct
  def load
    self.env = ENV['APP_ENV']
    self.bot_token = ENV['BOT_TOKEN']
    self
  end
end
