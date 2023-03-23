require 'csv'
require 'menu_item'
require 'menu'

def menu_load
  menu_return_arr = Array.new
  CSV.foreach('menu.csv') { |line| 
    menu_return_arr << menu_formatting_and_return(line) 
  }
  menu_return_arr.each { |line| 
    MenuItem.new(line[0],line[1],line[2])
  }
end

def menu_formatting_and_return(item)
  return_line = Array.new
  return_line << item[0]
  return_line << item[1].to_f
  if item[2] == "true"
    return_line << true
  else
    return_line << false
  end
  return return_line
end

print menu_load 