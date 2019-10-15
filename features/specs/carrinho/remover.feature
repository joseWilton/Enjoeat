#language: pt

Funcionalidade: Remover do carrinho
    Para que eu possa manter meu carrinho apenas com itens desejados 
    Sendo um cliente que desistiu de um ou mais produtos
    Posso remover itens do meu carrinho

    Cenario: Remover 1 item

        Dado que eu tenho os seguintes itens no carrinho:
            |nome                   |preco    |
            |Cup Cake               |R$ 8,70  |
            |Donut                  |R$ 2,50  |
            |Pão Artesanal Italiano |R$ 15,90 |
        Quando eu remover somente o primeiro item
        Então o valor total deve ser de "R$ 18,40"

    Cenario: Remover todos os itens

        Dado que eu tenho os seguintes itens no carrinho:
            |nome                   |preco    |
            |Cup Cake               |R$ 8,70  |
            |Donut                  |R$ 2,50  |
            |Pão Artesanal Italiano |R$ 15,90 |
        Então vejo a seguinte mensagem no carrinho "Seu carrinho está vazio!"