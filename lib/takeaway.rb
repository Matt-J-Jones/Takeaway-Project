class TakeawayOrder
  def initialize 
    @order = Array.new
  end

  def show_menu
    # Shows the menu, prices, and avalibility
  end

  def order_items
    # Prompts user to choose items from menu
    # Checks avalibility, and adds to order if avalible
    # Confirms item ordered
  end

  def confirm_order
    # Prints itemised list of all items ordered
    # Shows total price
    # Prompts user to confirm and continue
  end

  def tracking_and_confirmation
    # Confirms order
    # Sends message with estimated delivery time
  end
end