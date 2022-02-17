require 'redis'

class Authentication
  def initialize(user_id)
    @chave = "attempts:usuario:#{user_id}"
    @redis = Redis.new
  end

  def self.call(...)
    new(...).call
  end

  def self.validate(...)
    new(...).validate
  end

  def call
    @redis.incr(@chave)
  end

  def validate
    @redis.get(@chave)
  end
end
