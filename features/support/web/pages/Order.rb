

class OrderPage
    include Capybara::DSL
     
    def cost_shipping
        div = find("div[class*=col-sm-6]", text: "Frete e Total:")
        puts div.text
        div.all("table tbody tr")
    end
end