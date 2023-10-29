# describe "POST /forjar" do
#   examples = [

#     {
#       aplicabilidade: "AP2-001",
#       payload: { "pontoControle": {
#         "id": @dado_cenario["PontoControle"],
#         "data": "2022-12-13",

#       },
#                  "idFormaPgamento": @dado_cenario["idFormaPagamento"],
#                  "idTipoEntrega": @dado_cenario["idTipoEntrega"],
#                  "tipoVenda": @dado_cenario["tipoVenda"],
#                  "dataPrevisao": "2022-12-14",
#                  "vendedorOnline": "true" },
#     },

#   ]

#   examples.each do |e|
#     context "#{e[:aplicabilidade]}" do
#       before(:all) do
#         @result = PedidosApi.new.forjar(e[:payload, :aplicabilidade])
#       end
#       it "valida status code"
#       expect(@result).to eql 200
#     end
#   end
# end
