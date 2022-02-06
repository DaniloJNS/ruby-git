# frozen_string_literal: true

require 'redis'

redis = Redis.new

dataDoSorteio1 = '04-09-2013'
numerosDoSorteio1 = '10, 11, 18, 42, 55, 56'
chave1 = "resultado:#{dataDoSorteio1}:megasena"

dataDoSorteio2 = '07-09-2013'
numerosDoSorteio2 = '2, 21, 30, 35, 45, 50'
chave2 = "resultado:#{dataDoSorteio2}:megasena"

dataDoSorteio3 = '21-09-2013'
numerosDoSorteio3 = '2, 13, 24, 41, 42, 44'
chave3 = "resultado:#{dataDoSorteio3}:megasena"

dataDoSorteio4 = '02-10-2013'
numerosDoSorteio4 = '7, 15, 20, 23, 30, 41'
chave4 = "resultado:#{dataDoSorteio4}:megasena"

result = redis.mset(chave1, numerosDoSorteio1,
                    chave2, numerosDoSorteio2,
                    chave3, numerosDoSorteio3,
                    chave4, numerosDoSorteio4)

puts result
