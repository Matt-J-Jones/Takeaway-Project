require 'menu'

RSpec.describe Menu do
  it "creates new menu, returns blank" do
    menu = Menu.new
    expect(menu.print_menu).to eq []
  end

  it "adds item to menu, returns menu" do
    fake_item = double :item, return_item: "Chips: £2.00, Available", return_price: 2.00
    menu = Menu.new
    menu.add(fake_item)
    result = menu.print_menu
    expect(result).to eq [["Chips: £2.00, Available", 2.0]]
  end

  it "adds two items to menu, returns menu" do
    fake_item_0 = double :item, return_item: "Chips: £2.00, Available", return_price: 2.00
    fake_item_1 = double :item, return_item: "Rice: £3.00, Sold Out", return_price: 3.00
    menu = Menu.new
    menu.add(fake_item_0)
    menu.add(fake_item_1)
    result = menu.print_menu
    expect(result).to eq [["Chips: £2.00, Available", 2.0],["Rice: £3.00, Sold Out", 3.00]]
  end
end