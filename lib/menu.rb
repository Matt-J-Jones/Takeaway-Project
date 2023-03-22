class Menu
  def initialize
    @menu = Array.new
  end

  def add(item)
    # item is menu item
    # return_item is a string
    # return_price is an int of the items price
    @menu << [item.return_item, item.return_price]
  end

  def print_menu
    return @menu
  end
end