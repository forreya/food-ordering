require './lib/cart.rb'
require './lib/dish.rb'
require './lib/menu.rb'

menu = Menu.new(Kernel)
cart = Cart.new(Kernel, Net::HTTP)
dish1 = Dish.new("chicken rice", 20)
dish2 = Dish.new("char siew pao", 3)

menu.add_to_selection(dish1)
menu.add_to_selection(dish2)

menu.view_selection