# frozen_string_literal: true

module Pinger
  extend Discordrb::Commands::CommandContainer

  command :ping, description: 'Ping the bot' do |event|
    m = event.respond('Pong!')
    m.edit("Pong! (#{((Time.now - event.timestamp) * 1000).round} ms)")
  end
end
