require_relative 'application_redis'

class BitMap < ApplicationRedis
  attr_accessor :result

  def initialize(data, codigo)
    @data = data
    @codigo = codigo
    @redis = Redis.new
  end

  def call
    @redis.setbit "acesso:#{@data}", @codigo, 1
    self
  end
end
