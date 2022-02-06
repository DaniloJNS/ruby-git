# frozen_string_literal: true

require 'redis'

class FiltrarResultados
  def initialize(mes, ano)
    @mes  = mes
    @ano  = ano
    @redis = Redis.new
  end

  def self.call(mes:, ano:)
    new(mes, ano).call
  end

  def call
    filtrar
  end

  def filtrar
    chave = "resultado:*-#{@mes}-#{@ano}:megasena"
    @redis.keys(chave)
  end
end
