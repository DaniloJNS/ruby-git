require_relative 'util'
require 'optparse'

module Sidekiq
  class Cli
    include Util
    DEFAULT = {
      lifecycle_events: {
        shutdown: [],
        startup: []
      } 
    }

    def self.options
      @options ||= DEFAULT.dup
    end

    def self.configure
      yield self
    end

    def self.on(event, &block)
      raise ArgumentoErro unless event.is_a? Symbol
      raise ArgumentoErro unless options[:lifecycle_events].key? event

      options[:lifecycle_events][event] << block
    end

    def hello
      log "Olá"
    end
  end
end
