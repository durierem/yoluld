# frozen_string_literal: true

class ServerSettings < Mongoidal
  attr_reader :server_id
  attr_accessor :autojoin

  def initialize(...)
    super(...)
    @autojoin = @autojoin.nil? ? true : @autojoin
  end
end
