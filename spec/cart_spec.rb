
require 'cart'

describe Cart do
  it "returns an empty cart" do
    terminal = double(:terminal)
    cart = Cart.new(terminal)
    expect(terminal).to receive(:puts).with("Your cart is currently empty.")
    cart.view_cart
  end
end