# frozen_string_literal: true

require 'redis'

redis = Redis.new

codigoDoUsuario = '1962'
nomeDoUsuario = 'Peter Parker'
emailDoUsuario = 'spidey@marvel.com'
trita_minutos_em_segundos = 1800

chave  = "sessao:usuario:#{codigoDoUsuario}"
 
campos = [ "codigo", codigoDoUsuario, 'nome', nomeDoUsuario, 'email', emailDoUsuario]

redis.hmset(chave, campos)

redis.expire(chave, trita_minutos_em_segundos)
