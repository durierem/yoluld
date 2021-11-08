# frozen_string_literal: true

class ServerSettings < Mongoidal
  attr_accessor :server_id, :autojoin

  def initialize(...)
    super(...)
    @autojoin ||= true
  end
end
