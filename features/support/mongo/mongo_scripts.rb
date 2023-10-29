class MongoDB
  attr_accessor :TrackingsAtlas, :TrackingValidation, :SendMessage, :SendMessageValidation

  def initialize
    utils_project = UtilsProject.new
  end

  def obter_conexao(mongo)
    if ENV["CONFIG"] == "hlg"
      Mongo::Client.new("mongodb://sac_plataforma:sAcPl4t4Rf0m4@mdbh-sophia-1.dc.nova:27017,mdbh-sophia-2.dc.nova:27017,mdbh-sophia-3.dc.nova:27017/SAC_PlataformaComunicacao_QA?replicaSet=rsSOPHIAHLG")
    else
      Mongo::Client.new("mongodb://sac_plataforma:sAcPl4t4Rf0m4@mdbh-sophia-1.dc.nova:27017,mdbh-sophia-2.dc.nova:27017,mdbh-sophia-3.dc.nova:27017/SAC_PlataformaComunicacao?replicaSet=rsSOPHIAHLG")
    end
  rescue StandardError
    puts "[ERRO] Falha ao tentar conectar ao mongo #{@mongo}!"
  end

  def get_aplicabilidade(aplicabilidade)
    client = obter_conexao("hlg")
    if collection = client[:SendMessage].find({ "DirectOne.Aplicabilidade": aplicabilidade.to_s }).count > 1
      puts "Encontrei a aplicabilidade #{aplicabilidade} na SendMessage"
    end
  end

  def buscar_doc_mongo_tracking(id_entrega, ponto_controle)
    client = obter_conexao("hlg")
    collection = client[:TrackingValidation]
    collection.find({ EntregaId: id_entrega.to_i, PontoControle: ponto_controle })
  end

  def remover_tracking_mongo(id_entrega, id_pedido)
    client = obter_conexao("hlg")
    if client[:TrackingsAtlas].find({ IdEntrega: id_entrega.to_i, IdPedido: id_pedido.to_i }).count > 0
      client[:TrackingsAtlas].delete_many({ IdEntrega: id_entrega.to_i })
      puts "IDEntrega " + id_entrega + " deletado da tabela TrackingsAtlas"
      client.close
    end

    if client[:TrackingValidation].find({ EntregaId: id_entrega.to_i }).count > 0
      client[:TrackingValidation].delete_many({ EntregaId: id_entrega.to_i })
      puts "IDEntrega " + id_entrega + " deletado da tabela TrackingValidation"
      client.close
    end

    if client[:SendMessage].find({ IdEntrega: id_entrega.to_i }).count > 0
      client[:SendMessage].delete_many({ IdEntrega: id_entrega.to_i })
      puts "IDEntrega " + id_entrega + " deletado da tabela SendMessage"
      client.close
    end

    if client[:SendMessageValidation].find({ EntregaId: id_entrega.to_i }).count > 0
      client[:SendMessageValidation].delete_many({ EntregaId: id_entrega.to_i })
      puts "IDEntrega " + id_entrega + " deletado da tabela SendMessageValidation"
      client.close
    end
    # if client[:MultipleDeliveriesGroup].find({ IdPedido: id_pedido.to_i }).count > 0
    #   client[:MultipleDeliveriesGroup].delete_many({ IdPedido: id_pedido.to_i })
    #   puts "IdPedido " + id_pedido + " deletado da tabela MultipleDeliveriesGroup"
    #   client.close
    # end
  end
end
