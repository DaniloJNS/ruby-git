require_relative 'sidekiq/yield'
require 'connection_pool'
require 'redis'

Sidekiq::Yield.configure do |config|
  config.on(:startup) do
    puts config.hello
  end
end

Sidekiq::Yield.hello

puts Sidekiq::Yield.options

conection = ConnectionPool.new(size: 5, timeout: 5) { Redis.new }

conection.with(timeout: 2.0) do |redis|
  puts conection.size
  puts conection.available
  redis.set("estudante:danilo:age", "23" )
end
  
conection.with(timeout: 2.0) do |redis|
  puts conection.size
  puts conection.available
  redis.set("estudante:carlos:age", "23" )
end
