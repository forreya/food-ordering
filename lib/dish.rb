
class Dish
  def initialize(name, price)
    @name = name.split.map(&:capitalize).join(" ")
    @price = price
  end

  def name
    @name
  end

  def price
    @price
  end
end