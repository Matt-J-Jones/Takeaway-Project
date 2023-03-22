require 'twilio-ruby'


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

    # Prints itemised list of all items ordered
    # Shows total price
    # Prompts user to confirm and continue
  end

  def tracking_and_confirmation(time=(Time.now+900), client=Twilio::REST::Client.new(ENV['SID'], ENV['AUTH']))

    body = "Your order will arrive at #{time.hour}:#{time.min}"
    
    client.messages.create(
      from: '+14346867589',
      to: ENV['PHONE'],
      body: body
    )
    return "I was successful"
  end
end

# takeaway_order = TakeawayOrder.new
# items = ["Chips: £2.00, Available", 2.0],["Rice: £3.00, Sold Out", 3.00]
# takeaway_order.show_menu(items)