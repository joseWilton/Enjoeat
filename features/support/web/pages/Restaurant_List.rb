

class RestaurantListPage
    
    include Capybara::DSL

    def load
        
        visit "/restaurants"
    end

    def go(restaurante)
        
        find(".restaurant-item", text: restaurante.upcase).click
    end

    def list
        
        all(".restaurant-item")
    end
    
end