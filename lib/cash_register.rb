require "pry"

class CashRegister
attr_accessor :discount, :total, :quantity, :prices, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def total=(total)
        @total = total
    end

    def add_item(title, price, quantity = 1)
        @quantity = quantity
        @total += price * quantity
        quantity.times do |x|
            @items << title
            @prices << price
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            discount = @total * (@discount.to_f * 0.01)
            @total = @total - discount
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

     def items
        @items
     end

     def void_last_transaction
       self.total = self.total - self.last_transaction
     end
end
