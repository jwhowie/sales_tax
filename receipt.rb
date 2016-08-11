class Receipt
  def initialize
    items = []
  end
  def additem(item)
    items.push(item)
  end

  def print_receipt
    tax = 0
    items.each do |item|
      puts "#{item.item_qty} #{item.item_name} : item_cost"
      tax += item.tax
    end
  end
end

class Item
  attr_reader :item_name, :item_qty, :item_cost
  def initialize(cost, item_name, item_qty)
    @item_type = item_type.to_sym
    @item_types = {:book => 0.0, :food => 0.0, :medical_product => 0.0, :imported => 0.05}
    @item_name = item_name
    @cost = cost
    @tax_rate = 0.1
    @item_qty = item_qty

    determine_tax_rate

  end

  def determine_tax_rate
    keywords = item_name.split
    keywords.each do |item_type|
      if @item_types[item_type.to_sym] != nil
        temp_tax = @item_types[item_type.to_sym]
        if temp_tax == 0.0
          @tax_rate = 0
        else
          @tax_rate += temp_tax
        end

      end
    end
  end

  def get_tax
    return cost * @tax_rate
  end
end
