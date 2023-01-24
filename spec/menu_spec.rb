
require 'menu'

describe Menu do
  it "displays an empty menu" do
    @terminal = double(:terminal)
    @menu = Menu.new(@terminal)
    expect(@terminal).to receive(:puts).with("Our food selection is currently empty.")
    @menu.view_selection
  end

end