class MenuItem
  def initialize (name, price, availability)
    @name = name
    @price = price
    @availability = availability
  end

  def return_item
    return "#{@name}: £#{return_price_str}, #{return_status}"
  end

  def return_name
    return @name
  end

  def return_price
    return @price
  end

  def return_price_str
    temp = @price.to_s.split(".")
    if temp[1].length < 2
      return [temp[0], temp[1]+ "0"].join(".")
    end
  end

  def avalibility?
    return @availability
  end

  def mark_sold_out
    @availability = false
  end

  def return_status
    if avalibility?
      return "Available"
    else
      return "Sold Out"
    end
  end
end