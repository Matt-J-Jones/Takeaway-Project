class MenuItem
  def initialize (name, price, availability)
    @name = name
    @price = price
    @availability = availability
  end

  def return_item
    # returns string of items name, full price, and if it is sold out
    return "#{@name}: £#{return_price_str}, #{return_status}"
  end

  def return_name
    return @name
  end

  def return_price
    return @price
  end

  def return_price_str
    # returns price as a string, with trailing 0
    temp = @price.to_s.split(".")
    if temp[1].length < 2
      return [temp[0], temp[1]+ "0"].join(".")
    end
  end

  def availability?
    return @availability
  end

  def mark_sold_out
    @availability = false
  end

  def return_status
    if availability?
      return "Available"
    else
      return "Sold Out"
    end
  end
end