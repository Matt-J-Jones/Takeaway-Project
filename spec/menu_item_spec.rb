require 'menu_item'

RSpec.describe MenuItem do
  it "Creates menu item, returns full item as String" do
    item = MenuItem.new("Chips", 2.00, true)
    expect(item.return_item).to eq "Chips: £2.00, Available"
  end

  it "Creates menu item, returns each value individually" do
    item = MenuItem.new("Chips", 2.00, true)
    expect(item.return_name).to eq "Chips"
    expect(item.return_price).to eq 2.00
    expect(item.avalibility?).to eq true
  end

  it "Creates menu item, marks as sold out, returns sold out" do
    item = MenuItem.new("Chips", 2.00, true)
    expect(item.return_item).to eq "Chips: £2.00, Available"
    item.mark_sold_out
    expect(item.return_item).to eq "Chips: £2.00, Sold Out"
  end
end