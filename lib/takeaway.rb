require 'twilio-ruby'
require './lib/menu_item.rb'

class TakeawayOrder
  def initialize(menu, io = Kernel)
    @order = Array.new
    @io = io
    @menu = menu
  end

  def show_menu
    @menu.each_with_index { |item, index|
      @io.puts "#{index+1}. #{item.return_item}"
    }
    # menu is return value from class Menu
    # Shows the menu, prices, and avalibility
  end

  def add_to_order(item)
    system("clear") || system("cls")
    if item.availability?
      @order << item
      @io.puts "Item Added: #{item.return_name}"
    else
      @io.puts "Item Sold Out"
    end
    # Prompts user to choose items from menu
    # Checks avalibility, and adds to order if avalible
    # Confirms item ordered
  end

  def return_order
    return @order
  end

  def confirm_order
    total_price = 0
    @order.each_with_index { |item, index|
      @io.puts "#{index+1}. #{item.return_item}"
      total_price += item.return_price
    }
    @io.puts "Total: £#{sprintf('%.2f', total_price)}"
    tracking_and_confirmation
    # Prints itemised list of all items ordered
    # Shows total price
    # Prompts user to confirm and continue
  end

  def tracking_and_confirmation(time=(Time.now+900), client=Twilio::REST::Client.new(ENV['SID'], ENV['AUTH']))

    body = "Your order will arrive at #{time.hour}:#{time.min}"

    # enable to enable text alerts

    client.messages.create(
      from: '+14346867589',
      to: ENV['PHONE'],
      body: body
    )
    return true
  end
end

def menu_load
  menu = Array.new
  item_1 = MenuItem.new("Chips",2.00,true)
  item_2 = MenuItem.new("Rice",3.00,false)
  item_3 = MenuItem.new("Noodles",12.00,true)
  item_4 = MenuItem.new("Hamburger",7.00,true)
  item_5 = MenuItem.new("Cheeseburger",9.00,true)
  item_6 = MenuItem.new("Tofu burger",19.00,true)
  item_7 = MenuItem.new("Extra Sauce",0.50,true)
  item_8 = MenuItem.new("Coke",1.00,true)
  item_9 = MenuItem.new("Fanta",1.00,true)
  item_10 = MenuItem.new("Water",1.00,true)
  return [item_1, item_2, item_3, item_4,
            item_5, item_6, item_7, item_8,
            item_9, item_10]
end

def run 
  loop = true
  menu = menu_load
  takeaway_order = TakeawayOrder.new(menu)
  puts "Hello and Welcome to the Restaruant!"
  # takeaway_order.show_menu
  while loop
    takeaway_order.show_menu
    puts "Please enter the menu item you wish to add?"
    puts "(enter finish to complete)"
    selection = gets.chomp
    if selection == "finish"
      loop = false
      takeaway_order.confirm_order
    else
      takeaway_order.add_to_order(menu[selection.to_i-1])
    end
  end 
end

#Enable run to run program from terminal.
#run