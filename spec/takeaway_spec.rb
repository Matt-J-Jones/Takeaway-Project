require 'takeaway'

RSpec.describe TakeawayOrder do

  let(:fake_rice) { double(:fake_rice, name:"Rice", price: 3.00, availability: false) }
  let(:fake_chips) { double(:fake_chips, name:"Chips", price: 2.00, availability: true) }
  let(:io) { double :io }
  
  it "creates new order, returns menu" do    
    menu = [fake_rice, fake_chips]
    order = TakeawayOrder.new(menu, io)
    allow(fake_rice).to receive(:return_item).and_return("Rice: £3.00, Sold Out")
    allow(fake_chips).to receive(:return_item).and_return("Chips: £2.00, Available")
    expect(io).to receive(:puts).with("1. Rice: £3.00, Sold Out")
    expect(io).to receive(:puts).with("2. Chips: £2.00, Available")
    order.show_menu
  end

  it "creates new order, returns blank order" do
    menu = []
    order = TakeawayOrder.new(menu)
    expect(order.return_order).to eq []
  end

  it "creats new order, adds item to basket, returns" do
    allow(fake_rice).to receive(:availability?).and_return(false)
    allow(fake_chips).to receive(:availability?).and_return(true)
    allow(fake_chips).to receive(:return_name).and_return("Chips")
    menu = [fake_rice, fake_chips]
    order = TakeawayOrder.new(menu, io)
    expect(io).to receive(:puts).with("Item Sold Out")
    order.add_to_order(fake_rice)

    expect(io).to receive(:puts).with("Item Added: Chips")
    order.add_to_order(fake_chips)
  end

  it "creates new order, adds items to order, returns order" do
    allow(fake_rice).to receive(:availability?).and_return(false)
    allow(fake_chips).to receive(:availability?).and_return(true)
    allow(fake_chips).to receive(:return_name).and_return("Chips")
    menu = [fake_rice, fake_chips]
    order = TakeawayOrder.new(menu, io)
    expect(io).to receive(:puts).with("Item Added: Chips")
    order.add_to_order(fake_chips)
    expect(order.return_order).to eq [fake_chips]
  end
  
  it "creates new order, adds items, returns order total and price" do
    allow(fake_rice).to receive(:availability?).and_return(false)
    allow(fake_chips).to receive(:availability?).and_return(true)
    allow(fake_rice).to receive(:return_item).and_return("Rice: £3.00, Sold Out")
    allow(fake_chips).to receive(:return_item).and_return("Chips: £2.00, Available")
    allow(fake_chips).to receive(:return_name).and_return("Chips")
    allow(fake_chips).to receive(:return_price).and_return(2.00)

    menu = [fake_rice, fake_chips]
    order = TakeawayOrder.new(menu, io)

    expect(io).to receive(:puts).with("Item Added: Chips")
    expect(io).to receive(:puts).with("Item Added: Chips")
    order.add_to_order(fake_chips)
    order.add_to_order(fake_chips)

    
    expect(io).to receive(:puts).with("1. Chips: £2.00, Available")
    expect(io).to receive(:puts).with("2. Chips: £2.00, Available")
    
    expect(io).to receive(:puts).with("Total: £4.00")
    order.confirm_order
  end

  it "Receives order, returns delivery time" do
    menu = [fake_rice, fake_chips]
    order = TakeawayOrder.new(menu, io)
    fake_time = Time.new(2023, 3, 22, 16, 45, 25)
    fake_client = double :client
    allow(fake_client).to receive_message_chain(:messages, :create).with(from: '+14346867589', to: ENV['PHONE'], body: "Your order will arrive at 16:45")
    expect(order.tracking_and_confirmation(fake_time, fake_client)).to eq true
    
  end
end