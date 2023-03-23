require 'takeaway'
require 'menu_item'

RSpec.describe "Takeaway intgration test" do
  it "creates new order, returns blank order" do
    menu = []
    order = TakeawayOrder.new(menu)
    expect(order.return_order).to eq []
  end

  it "creates new order, adds items to order, returns order" do
    item_1 = MenuItem.new("Chips",2.00,true)
    item_2 = MenuItem.new("Rice",3.00,false)
    item_3 = MenuItem.new("Noodles",12.00,true)
    menu = [item_1, item_2, item_3]
    order = TakeawayOrder.new(menu)
    order.add_to_order(item_1)
    expect(order.return_order).to eq [item_1]
  end
end