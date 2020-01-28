
Before do
    page.current_window.resize_to(1366, 768)
    @rest_list_page = RestaurantListPage.new
    @restaurant_page = RestaurantPage.new
end

Before("@bread_bakery") do
    visit '/restaurants/bread-bakery/menu'
end