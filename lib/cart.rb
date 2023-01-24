
class Cart
  def initialize(terminal)
    @cart = []
    @terminal = terminal
  end

  def view_cart
    if @cart.empty?
      @terminal.puts "Your cart is currently empty."
    else
      @terminal.puts "Your cart:"
      total = 0
      0..@cart.length.times {
        |i|
        @terminal.puts "#{i+1}. #{@cart[i].name} - RM#{@cart[i].price}"
        total += @cart[i].price
      }
      @terminal.puts("Total: RM#{total}")
    end
  end

  def add_to_cart(dish,menu)
    @cart.push(dish) if menu.selection_data.include?(dish)
    @terminal.puts("This dish is not on the menu.") if !menu.selection_data.include?(dish)
  end
end