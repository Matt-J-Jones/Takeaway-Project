require 'menu'

RSpec.describe Menu do
  it "creates new menu, returns blank" do
    menu = Menu.new
    expect(menu.print_menu).to eq []
  end
end