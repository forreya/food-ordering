# Food Ordering Program Design Recipe

## 1. Describe the Problem

First part of user requirements:

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Second part of user requirements:

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

Diagram made using asciiflow.com:

```
          ┌────────────────────────────────────┐
          │Cart(cart)                          │
          │                                    │
          │                                    │
          │- add_to_cart(dish,menu)            │
          │- view_cart                         │
          │- order                             │
          │- delivery_time                     │
          │                                    │
          │                                    │
          └────────────────────────────────────┘
            ▲                                 ▲
            │                                 │
            │                                 │
            │                                 │
┌───────────┴────────────┐      ┌─────────────┴───────────┐
│Dish(name, price)       │      │Menu(selection)          │
│                        │      │                         │
│                        │      │                         │
│- name                  │      │- view_selection         │
│- price                 ├─────►│- add_to_selection(dish) │
│                        │      │- selection_data         │
│                        │      │                         │
└────────────────────────┘      └─────────────────────────┘
```

```ruby

# Cart class
class Cart
    def initialize
        # creates an empty cart array
    end

    def add_to_cart(dish,menu) 
        # dish is an instance of Dish
        # menu is an instance of Menu
        # Dish gets added to the cart array if the dish is in the menu
        # Otherwise, throws an error telling user the dish isn't in the menu
        # Returns nothing
    
    end

    def view_cart
        # return the cart array
    end

    def order
        # texts the successful order message along with expected delivery time if there are items in the cart (using 'calculate_delivery_time' method)
        # if cart is empty, print message telling user cart is empty
    end

    def delivery_time
        # adds 40 minutes to current server time to return the expected delivery time in a nicely formatted string
    end
end

# Menu class
class Menu(terminal)
  def initialize
        # creates an empty selection array
    end

    def view_selection
        # returns the selection array
    end

    def add_to_selection(dish) 
        # dish is an instance of Dish
        # Dish gets added to the selection array
        # Returns nothing
    end

    def selection_data
        # returns the selection array
    end
end

# Dish class
class Dish
    def initialize(name, price) # name is a string, price is an integer
        # @name = name
        # @price = price
    end

    def name
        # returns a name as a string
    end

    def price
        # returns a price as an integer
    end
end

```

## 3. Create Examples as Integration Tests

```ruby

# Menu x Dish

# 1 Adds 2 dishes to menu and displays full selection
menu = Menu.new
dish1 = Dish.new("chicken rice", 20)
dish2 = Dish.new("char siew pao", 3)
menu.add_to_selection(dish1, menu)
menu.add_to_selection(dish2, menu)
menu.view_selection # => 
#   "
#     Our food selection:
#     1. Chicken Rice - RM20
#     2. Char Siew Pao - RM3
#   "

# Cart x Menu x Dish

# 1 Adds 2 dishes from selection to the cart and displays cart
menu = Menu.new
cart = Cart.new
dish1 = Dish.new("chicken rice", 20)
dish2 = Dish.new("char siew pao", 3)
menu.add_to_selection(dish1)
menu.add_to_selection(dish2)
cart.add_to_cart(dish1, menu)
cart.add_to_cart(dish2, menu)
cart.view_cart # => 
#   "
#     Your cart:
#     1. Chicken Rice - RM20
#     2. Char Siew Pao - RM3
#   "

# 2 Tries to add a dish that is not on the menu to the cart
menu = Menu.new
cart = Cart.new
dish1 = Dish.new("chicken rice", 20)
dish2 = Dish.new("char siew pao", 3)
menu.add_to_selection(dish1, menu)
menu.add_to_selection(dish2, menu)
dish3 = Dish.new("siew mai", 2)
cart.add_to_cart(dish3, menu) # => "This dish is not on the menu."

# 3 Adds 2 dishes from the menu to the cart and orders the food, prints a message informing the user of the delivery time
menu = Menu.new
cart = Cart.new
dish1 = Dish.new("chicken rice", 20)
dish2 = Dish.new("char siew pao", 3)
menu.add_to_selection(dish1, menu)
menu.add_to_selection(dish2, menu)
cart.add_to_cart(dish1, menu)
cart.add_to_cart(dish2, menu)
cart.order # => Thank you! Your order was placed and will be delivered before 14:31 (assuming current local time is 13:51)

# 4 Adds 2 dishes from the menu to the cart and orders the food, prints a message informing the user of the delivery time
menu = Menu.new
cart = Cart.new
dish1 = Dish.new("chicken rice", 20)
dish2 = Dish.new("char siew pao", 3)
menu.add_to_selection(dish1, menu)
menu.add_to_selection(dish2, menu)
cart.add_to_cart(dish1, menu)
cart.add_to_cart(dish2, menu)
cart.order # => Thank you! Your order was placed and will be delivered before 15:29 (assuming current local time is 14:49)

```

## 4. Create Examples as Unit Tests

```ruby

# Dish 

# 1 Returns name and price of dish
dish1 = Dish.new("chicken rice", 20)
dish1.name # => "Chicken Rice"
dish1.price # => "RM 20"

# Menu

# 1 Tries to view empty menu selection
menu = Menu.new
menu.view_selection # => "Our food selection is currently empty."

# Cart

# 1 Tries to display empty cart
cart = Cart.new
cart.view_cart # => "Your cart is currently empty."

# 2 Tries to order food but the cart is empty
cart = Cart.new
cart.order # => "Order failed. Your cart is empty."

```

## 5. Implement the Behaviour
_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._