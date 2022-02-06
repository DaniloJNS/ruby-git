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

    attr_accessor :options

    def initialize
      parse_options
    end

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

    def parse_options(argv=ARGV)
      @options = {
        :verbose => false,
        :queues => ['default'],
        :worker_count => 25,
        :server => 'redis://localhost:6379/0',
        :rails => '.',
        :environment => 'production',
      }

      @parser = OptionParser.new do |o|
        o.on "-q", "--queue QUEUE,WEIGHT", "Queue to process, with optional weight" do |arg|
          (q, weight) = arg.split(",")
          (weight || 1).times do
            @options[:queues] << q
          end
        end

        o.on "-v", "--verbose", "Print more verbose output" do
          @options[:verbose] = true
        end

        o.on "-s", "--server LOCATION", "Where to find the server" do |arg|
          @options[:server] = arg
        end

        o.on '-e', '--environment ENV', "Rails application environment" do |arg|
          @options[:environment] = arg
        end

        o.on '-r', '--rails PATH', "Rails application with workers" do |arg|
          @options[:rails] = arg
        end

        o.on '-c', '--concurrency INT', "Worker threads to use" do |arg|
          @options[:worker_count] = arg.to_i
        end
      end

      @parser.banner = "sidekiq [options]"
      @parser.on_tail "-h", "--help", "Show help" do
        log @parser
        exit 1
      end
      @parser.parse!(argv)
    end
  end
end
