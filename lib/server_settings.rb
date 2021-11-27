# frozen_string_literal: true

class ServerSettings < Mongoidal
  attr_reader :server_id, :autojoin

  def initialize(...)
    super(...)
    @autojoin = @autojoin.nil? ? true : @autojoin
  end

  def autojoin=(val)
    case val
    in 'true'
      @autojoin = true
    in 'false'
      @autojoin = false
    in [TrueClass, FalseClass]
      @autojoin = val
    else
      raise ArgumentError
    end
  end
end
