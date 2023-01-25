
require 'date'
require 'json'

class Cart
  def initialize(terminal, requester)
    @cart = []
    @terminal = terminal
    @requester = requester
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

  def order
    if @cart.empty?
      @terminal.puts("Order failed. Your cart is empty.")
    else
      @terminal.puts "Thank you! Your order was placed and will be delivered before #{delivery_time}."
    end
  end

  def delivery_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    full_time = DateTime.parse(json["utc_datetime"]).to_time.to_s[11..15]
    hour = full_time[0..1].to_i
    min = full_time[3..4].to_i
    min += 40
    if min > 60 
      min = min - 60
      hour += 1
    end
    return "#{hour}:#{min}"
  end
end

