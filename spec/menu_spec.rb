
require 'menu'

describe Menu do
  before(:each) do
    @terminal = double(:terminal)
    @menu = Menu.new(@terminal)
  end

  it "displays an empty menu" do
    expect(@terminal).to receive(:puts).with("Our food selection is currently empty.")
    @menu.view_selection
  end

  it "adds 2 dishes to menu and displays the menu selection" do
    dish1 = double(:dish, name: "Chicken Rice", price: 20)
    dish2 = double(:dish, name: "Char Siew Pao", price: 3)
    @menu.add_to_selection(dish1)
    @menu.add_to_selection(dish2)
    expect(@terminal).to receive(:puts).with("Our food selection:")
    expect(@terminal).to receive(:puts).with("1. Chicken Rice - RM20")
    expect(@terminal).to receive(:puts).with("2. Char Siew Pao - RM3")
    @menu.view_selection
  end

end