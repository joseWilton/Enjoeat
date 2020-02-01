

Dado("que o produto desejado é {string}") do |produto|

    @produto_nome = produto
end

Dado("o valor do produto é de {string}") do |valor|
    @produto_valor = valor
end

Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    
    quantidade.times do
        @restaurant_page.add_to_cart(@produto_nome)
    end
end

Então("deve ser adicionado {int} unidade\\(s) desse produto no carrinho") do |quantidade|

    expect(@restaurant_page.cart.box).to have_text "(#{quantidade}x) #{@produto_nome}"
    
end
  

Então("o valor total deve ser de {string}") do |valor_total|
    
    expect(@restaurant_page.cart.total.text).to have_text valor_total

end

#######Lista de produtos#############

Dado("que os produtos desejados são:") do |table|

    @product_list = table.hashes
end
  
Quando("eu adiciono todos os itens") do
    
    @product_list.each do |prod|
        prod["quantidade"].to_i.times do       
            @restaurant_page.add_to_cart(prod["nome"])          
        end
    end
end

Então("vejo todos os itens no carrinho") do
        
    @product_list.each do |prod|
        expect(@restaurant_page.cart.box).to have_text "(#{prod["quantidade"]}x) #{prod["nome"]}"
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

    @restaurant_page.cart.remove_item(item)
end

######### Remover todos os itens ##########

Quando("eu remover todos os itens") do
  
    @product_list.each_with_index do |value, idx|
        
        @restaurant_page.cart.remove_item(idx)
    end
end

Quando("eu limpo meu carrinho") do

    @restaurant_page.cart.clean
end
  
Então("vejo a seguinte mensagem no carrinho {string}") do |msg|

    
    expect(@restaurant_page.cart.box).to have_text msg
end


####### Fechar pedido ###########

Dado("que adiciono  os seguintes itens no carrinho:") do |table|

    @product_list = table.hashes
    steps %[
        Quando eu adiciono todos os itens
    ]
end

Quando("eu fecho o meu carrinho") do

    @restaurant_page.cart.close
end

Então("o total de itens deve ser igual a {string}") do |total_items|

    expect(@order_page.cost_shipping[0]).to have_text total_items
end

Então("o valor do frete deve ser igual a {string}") do |shipping|

    expect(@order_page.cost_shipping[1]).to have_text shipping
end

Então("o valor total da compra deve ser igual a {string}") do |total_cart|

    expect(@order_page.cost_shipping[2]).to have_text total_cart

end
  
  