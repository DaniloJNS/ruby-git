require 'json'
require_relative 'sessions'

cookies = Sessions.from_json('zimobi/src/cookies.json')

puts cookies
