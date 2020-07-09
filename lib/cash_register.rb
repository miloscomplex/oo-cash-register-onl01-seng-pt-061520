require "pry"
class CashRegister

  attr_accessor :total, :last_item_cost, :discount, :all_items, :previous_total

  def initialize(discount=false)
    @total = 0
    @discount = discount
    @all_items = []
    @last_transaction_cost = 0
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    #accepts a title, price and increases total
    #accepts an optional quantitiy
    #doesn't forget the previous total
    @previous_total = @total
    quantity.times { @all_items << title }
    @last_item_cost = price * quantity
    self.total += price * quantity
  end

  def apply_discount
    #applies the discount 20% to the total price
    discount_total = self.total * 0.20
    @total = @total - discount_total
    #reduces the total
    if self.discount
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    #@total -= @last_item_cost
    # @all_items.count > 0 ? @total : @total = 0.0
    @total -= @last_item_cost
    @all_items.count > 1 ? @total : @total = 0.0
    #binding.pry
    #subtracts the last item from the total
    #if all items are removed total = 0.0
  end

end
