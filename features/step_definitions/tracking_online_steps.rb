require "kafka"
require "mongo"

Dado("que eu tenho um pedido com as seguintes informações:") do |table|
  @dado_cenario = table.hashes.first
end
Dado("confirmo que não exista um pedido nas tabelas do mongo") do
  @doc_mongo.remover_tracking_mongo(@dado_cenario[:IdEntrega], @dado_cenario[:IdPedido])
end

Dado("que ele atenda as seguintes condicoes de jornada do cliente {string}") do |massa|
  #Pending
  # @dado_cenario = PedidosApi.new.forjar(@dado_cenario[:IdEntrega], massa[:Aplicabilidade])
  # puts "#{@dado_cenario} sou o dado cenario"
end

Quando("submeto o cadastro desse item em uma fila de pedidos kafka") do
  msg = get_tracking_message(

    @dado_cenario[:IdEntrega],
    @dado_cenario[:PontoControle],
    @dado_cenario[:IdUnidadeNegocio]

  )
  @send_kafka.send_kafka_qa(msg)

  puts msg
end

Entao("devo ser informado via email o calculo da aplicabilidade") do
  puts "Aguardando 10 segundos para verificação no Mongo"
  sleep 10
  @doc_mongo.buscar_doc_mongo_tracking(@dado_cenario[:IdEntrega], @ponto_controle)
  if @doc_mongo.count > 0
  else
    puts "Valor não encontrado, Aguardando mais 30 segundos para nova verificação"
    sleep 30
    doc_mongo.buscar_doc_mongo_tracking(@dado_cenario[:IdEntrega], @ponto_controle)
    expect(doc_mongo.count).to eql 1
  end
end
