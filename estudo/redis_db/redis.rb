require 'yaml'

puts YAML.load(File.open(File.expand_path('../redis.yml', __FILE__)))
