#language: pt

Funcionalidade: Informações adicionais
    Para  que eu possa ver as informações adicionais
    Sendo um usuario que escolheu um restaurante
    Posso ver a categoria, descrição detalhada e horarios de funcionamento

    @infos
    Cenario: Detalhes do restaurante
        
        Dado que acesso a lista de restaurantes
        Quando eu escolho o restaurante "Burger House"
        Então eu vejo as seguintes informações adicionais:
            |categoria  | Hamburgers                              |
            |descricaoo | 40 anos s especializando em trash food. |
            |horario    | Funciona todos os dias, de 10h às 22h   |