# frozen_string_literal: true

class ServerSettings < Mongoidal
  attr_reader :server_id, :autojoin

  def initialize(...)
    super(...)
    @autojoin = true if @autojoin.nil?
  end

  def autojoin=(val)
    case val
    in 'true'
      @autojoin = true
    in 'false'
      @autojoin = false
    in [true, false]
      @autojoin = val
    else
      raise ArgumentError
    end
  end
end
