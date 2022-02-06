module Sidekiq
  module Util
    def log msg
      STDOUT.puts msg
    end
    def self.log msg
      STDOUT.puts msg
    end
  end
end
