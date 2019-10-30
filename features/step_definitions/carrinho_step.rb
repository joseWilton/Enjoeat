

Dado("que o produto desejado é {string}") do |produto|

    @produto_nome = produto
end

Dado("o valor do produto é de {string}") do |valor|
    @produto_valor = valor
end

Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    
    quantidade.times do
        find('.menu-item-info-box', text: @produto_nome.upcase).find('.add-to-cart').click
    end
end

Então("deve ser adicionado {int} unidade\\(s) desse produto no carrinho") do |quantidade|

    expect(@cart.box).to have_text "(#{quantidade}x) #{@produto_nome}"
    
end
  

Então("o valor total deve ser de {string}") do |valor_total|
    
    expect(cart.total.text).to have_text valor_total

end

#######Lista de produtos#############

Dado("que os produtos desejados são:") do |table|

    @product_list = table.hashes
end
  
Quando("eu adiciono todos os itens") do
    
    @product_list.each do |prod|
        prod["quantidade"].to_i.times do
            find('.menu-item-info-box', text: prod["nome"].upcase).find('.add-to-cart').click            
        end
    end
end

Então("vejo todos os itens no carrinho") do
        
    @product_list.each do |prod|
        expect(@cart.box).to have_text "(#{prod["quantidade"]}x) #{prod["nome"]}"
    end
end
  

######### Remover item ##########

Dado("que eu tenho os seguintes itens no carrinho:") do |table|
    
    @product_list = table.hashes
    steps %[
        Quando eu adiciono todos os itens
    ]
end

Quando("eu remover somente o {int}") do |item|

    @cart.remove_item(item)
end

######### Remover todos os itens ##########

Quando("eu remover todos os itens") do
  
    @product_list.each_with_index do |value, idx|
        
        @cart.remove_item(idx)
    end
end

Quando("eu limpo meu carrinho") do

    click_button 'Limpar'
end
  
Então("vejo a seguinte mensagem no carrinho {string}") do |msg|

    
    expect(@cart.box).to have_text msg
end

  
  