
require 'cart'

describe Cart do
  before(:each) do
    @terminal = double(:terminal)
    @fake_requester = double(:requester)
    @twilio_requester = double(:twilio_requester)
    @account_sid = '123456789'
    @auth_token = '987654321'
    @fake_number = '+446222949749'

    @dish1 = double(:dish, name: "Chicken Rice", price: 20)
    @dish2 = double(:dish, name: "Char Siew Pao", price: 3)
    @menu = double(:menu, selection_data: [@dish1, @dish2])
    @cart = Cart.new(@terminal, @fake_requester, @twilio_requester, @account_sid, @auth_token, @fake_number)
  end

  it "returns an empty cart" do
    expect(@terminal).to receive(:puts).with("Your cart is currently empty.")
    @cart.view_cart
  end

  it "adds a dish that is not on the menu, returns a message telling the user that this dish doesn't exist" do
    dish3 = double(:dish, name: "Siew Mai", price: 2)
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

  it "tries to order but the cart is empty so it returns a message saying your cart is empty" do
    expect(@terminal).to receive(:puts).with("Order failed. Your cart is empty.")
    @cart.order

  end
end