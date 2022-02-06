require 'redis'
require_relative 'application_redis'

class PaginasVisitas < ApplicationRedis
  attr_accessor :pagina, :data, :chave, :redis

  def initialize pagina, data
    @pagina = pagina
    @data = data
    @redis = Redis.new
  end

  def call 
    @chave = "pagina:#{pagina}:#{data}"
    gerar_estatisticas
  end

  def gerar_estatisticas
    resultado = @redis.incr(@chave)
    puts "página #{pagina} teve #{resultado} acesso(s) em #{data}"
  end
end
