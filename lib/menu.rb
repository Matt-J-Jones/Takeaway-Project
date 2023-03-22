class Menu
  def initialize
    @menu = Array.new
  end

  def add(item)
    # item is a string return from menu_item
    @menu << item.return_item
    @menu << item.return_price
  end

  def print_menu
    return @menu
  end
end