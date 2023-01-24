
require 'dish'

describe Dish do
  it "returns name and price of dish" do
    dish1 = Dish.new("chicken rice", 20)
    expect(dish1.name).to eq "Chicken Rice"
    expect(dish1.price).to eq 20
  end
end