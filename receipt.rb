class Receipt
  def initialize
    @items = []
  end
  def additem(item)
    @items.push(item)
  end

  def print_receipt
    tax = 0
    total = 0
    @items.each do |item|
      puts "#{item.item_qty} #{item.item_name} :#{(item.item_cost + item.get_tax).round(2)}"
      tax += item.get_tax
      total += item.item_cost
    end
    puts "Sales Tax: #{tax.round(2)}"
    puts "Total: #{(tax + total).round(2)}"
  end
end

class Item
  attr_reader :item_name, :item_qty, :item_cost, :tax_rate
  def initialize(item_name, item_qty, cost)
    #@item_type
    @item_types = {:book => -0.1, :chocolate => -0.1, :chocolates => -0.1, :pills => -0.1, :imported => 0.05}
    @item_name = item_name
    @item_cost = cost
    @tax_rate = 0.0
    @item_qty = item_qty

    determine_tax_rate

  end

  def determine_tax_rate
    keywords = @item_name.split()
    temp_tax = 0.1
    keywords.each do |item_type|
      if @item_types[item_type.to_sym] != nil
        found_tax = @item_types[item_type.to_sym]
        temp_tax += found_tax
      end
    end

    @tax_rate = temp_tax
  end

  def get_tax
    return (@item_cost * @tax_rate * 20).ceil.to_f / 20
  end
end

receipt = Receipt.new
item = Item.new("book", 1, 12.49)
receipt.additem(item)
item = Item.new("music cd", 1, 14.99)
receipt.additem(item)
item = Item.new("chocolate bar", 1, 0.85)
receipt.additem(item)
receipt.print_receipt
puts " "
receipt = Receipt.new
item = Item.new("imported box of chocolates at", 1, 10.00)
receipt.additem(item)
item = Item.new("imported bottle of perfume at ", 1, 47.50)
receipt.additem(item)
receipt.print_receipt
puts " "
receipt = Receipt.new
item = Item.new("imported bottle of perfume at", 1, 27.99)
receipt.additem(item)
item = Item.new("bottle of perfume", 1, 18.99)
receipt.additem(item)
item = Item.new("packet of headache pills", 1, 9.75)
receipt.additem(item)
item = Item.new("box of imported chocolates", 1, 11.25)
receipt.additem(item)
receipt.print_receipt
