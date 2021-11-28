# frozen_string_literal: true

require 'singleton'

class Config
  include Singleton

  def self.fetch(key)
    instance.hash.fetch(key)
  end

  attr_reader :hash

  def initialize
    @hash = {
      bot_token: ENV['BOT_TOKEN'],
      bot_prefix: ENV['BOT_PREFIX'],
      application_id: ENV['APPLICATION_ID'].to_i
    }
  end
end
