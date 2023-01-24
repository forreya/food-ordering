
require 'dish'
require 'menu'
require 'cart'

describe "integration" do
  before(:each) do
    @terminal = double(:terminal)
    @menu = Menu.new(@terminal)
    @dish1 = Dish.new("chicken rice", 20)
    @dish2 = Dish.new("char siew pao", 3)
    @menu.add_to_selection(@dish1)
    @menu.add_to_selection(@dish2)
    @cart = Cart.new(@terminal)
  end
  
  it "adds 2 dishes to menu and displays the menu selection" do
    expect(@terminal).to receive(:puts).with("Our food selection:")
    expect(@terminal).to receive(:puts).with("1. Chicken Rice - RM20")
    expect(@terminal).to receive(:puts).with("2. Char Siew Pao - RM3")
    @menu.view_selection
  end

    it "adds a dish that is not on the menu, returns a message telling the user that this dish doesn't exist" do
    dish3 = Dish.new("siew mai", 2)
    expect(@terminal).to receive(:puts).with("This dish is not on the menu.")
    @cart.add_to_cart(dish3,@menu)
  end

  it "adds 2 dishes from the menu to the cart and displays the cart" do
    @cart.add_to_cart(@dish1,@menu)
    @cart.add_to_cart(@dish2,@menu)
    expect(@terminal).to receive(:puts).with("Your cart:")
    expect(@terminal).to receive(:puts).with("1. Chicken Rice - RM20")
    expect(@terminal).to receive(:puts).with("2. Char Siew Pao - RM3")
    expect(@terminal).to receive(:puts).with("Total: RM23")
    @cart.view_cart
  end

  # NOW WE MUST TTD THE 'ORDER' METHOD
  # WE ARE ON TO THE SECOND PART OF THE USER STORY

end