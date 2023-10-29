#language: pt

Funcionalidade: Informar que o meu pagamento foi aprovado
    Sendo cliente Via quero ser informado via email que o
    meu pagamento foi aprovado quando realizar a minha
    compra online

    @tracking_online
    Esquema do Cenario: Pagamento aprovado AP2-001

        Dado que eu tenho um pedido com as seguintes informações:

            | IdEntrega    | IdPedido    | PontoControle    | IdUnidadeNegocio  | Aplicabilidade   | idFormaPagamento     | idTipoEntrega     | tipoVenda    | vendedorOnline   |
            | <id_entrega> | <id_pedido> | <ponto_controle> | <unidade_negocio> | <aplicabilidade> | <id_forma_pagamento> | <id_tipo_entrega> | <tipo_venda> | <vendedorOnline> |
            E confirmo que não exista um pedido nas tabelas do mongo
            # E que ele atenda as seguintes condicoes de jornada do cliente "<aplicabilidade>"
        Quando submeto o cadastro desse item em uma fila de pedidos kafka
        Entao devo ser informado via email o calculo da aplicabilidade

        Exemplos:
            | id_entrega  | id_pedido | ponto_controle | unidade_negocio | aplicabilidade | id_forma_pagamento | id_tipo_entrega | tipo_venda | vendedorOnline |
            | 25456853901 | 254568539 | PAP            | 1               | AP2-001        | 3                  | 1              | B2C        | true           |
