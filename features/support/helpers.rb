module HELPERS
    
  def get_tracking_message(id_entrega, ponto_controle, unidade_negocio)
    timestamp = Time.now.to_s
    day = timestamp[8, 2]
    month = timestamp[5, 2]
    year = timestamp[0, 4]

    message_json = {
      'Trackings': [
        {
              'IdCompanhia': 1,
              'IdEntrega': id_entrega,
              'IdUnidadeNegocio': unidade_negocio,
              'Origem': "LJ",
              'DataLimiteCd': nil,
              'DataEntregaCorrigida': nil,
              'DataEntregaPrometida': nil,
              'Sro': nil,
              'ETicket': nil,
              'CodigoEtiquetaConferencia': nil,
              'IdTipoEntrega': nil,
              'CnpjFilial': "0",
              'IdFilial': 0,
              'Transportadora': nil,
              'PontoControle': {
                'IdPontoControle': ponto_controle,
                'Descricao': "Pedido Incluido",
                'DataOcorrencia': "#{year}-#{month}-#{day}T15:12:44.1297689-03:00",
                'DescricaoCliente': nil,
                'DescricaoDetalhada': nil,
                'DisponivelCliente': false,
                'EnviarEmail': false,
                'IdFasePedido': 1,
                'Link': nil,
                'TenantId': 0,
                'Titulo': nil,
              },
              'Devolucao': nil,
              'NotaFiscalEntrega': nil,
              'NotaFiscalFatura': nil,
              'DataAjustada': nil,
            },
      ],
    }

    message_json
  end
end
