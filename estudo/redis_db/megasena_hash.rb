# frozen_string_literal: true

require 'redis'

redis = Redis.new

ganhadores = '22'
dataDoSorteio = '09-11-2013'
numeros = '8, 18, 26, 42, 56, 58'
chave = "resultado:#{dataDoSorteio}:megasena"

resultado1 = redis.hset(chave, 'ganhadores', ganhadores)
resultado2 = redis.hset(chave, 'numeros', numeros)

puts "Resultado 1 = #{resultado1}, Resultado 2 = #{resultado2}"
