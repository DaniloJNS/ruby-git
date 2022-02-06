require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 2 }
end

class OurWorker
  include Sidekiq::Worker

  def perform complexity
    case complexity
    when "super_hard"
      sleep 20
      puts 'Demorou mas foi processado'
    when "hard"
      sleep 10
      puts 'Sofri mas foi'
    when "easy"
      sleep 1
      puts "ja foi papai"
    end
  end
end
