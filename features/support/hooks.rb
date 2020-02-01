
Before do
    page.current_window.resize_to(1366, 768)
    @rest_list_page = RestaurantListPage.new
    @restaurant_page = RestaurantPage.new
    @order_page = OrderPage.new
end

Before("@bread_bakery") do
    visit '/restaurants/bread-bakery/menu'
end

Before("@green_food")do
    visit '/restaurants/green-food/menu'
end