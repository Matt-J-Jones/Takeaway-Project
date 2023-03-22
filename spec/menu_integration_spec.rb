require 'menu'
require 'menu_item'

RSpec.describe "Creates and returns Menu" do
  it "creates new menu, returns blank" do
    menu = Menu.new
    expect(menu.print_menu).to eq []
  end

  it "adds item to menu, returns menu" do
    item = MenuItem.new("Chips", 2.00, true)
    menu = Menu.new
    menu.add(item)
    result = menu.print_menu
    expect(result).to eq [["Chips: £2.00, Available", 2.0]]
  end

  it "adds two items to menu, returns menu" do
    item_0 = MenuItem.new("Chips", 2.00, true)
    item_1 = MenuItem.new("Rice", 3.00, false)
    menu = Menu.new
    menu.add(item_0)
    menu.add(item_1)
    result = menu.print_menu
    expect(result).to eq [["Chips: £2.00, Available", 2.0],["Rice: £3.00, Sold Out", 3.00]]
  end
end