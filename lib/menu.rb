
class Menu
  def initialize(terminal)
    @selection = []
    @terminal = terminal
  end

  def view_selection
    if @selection.empty?
      @terminal.puts "Our food selection is currently empty."
    else
      @terminal.puts "Our food selection:"
      0..@selection.length.times {
        |i|
        @terminal.puts "#{i+1}. #{@selection[i].name} - RM#{@selection[i].price}"
      }
    end
  end

  def add_to_selection(dish)
    @selection.push(dish)
  end

  def selection_data
    @selection
  end

end