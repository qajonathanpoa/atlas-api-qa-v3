# require_relative "base_api"

# class PedidosApi < BaseApi
#   def forjar(payload, aplicabilidade)
#     return self.class.post(
#              "/Pedidos/forjar/#{@dado_cenario[:IdEntrega]}/1/1",
#              body: @payload.to_json,
#              headers: {
#                "Content-type": "application/json",
#                "accept": "*/*",

#              },
#            )
#   end
# end
