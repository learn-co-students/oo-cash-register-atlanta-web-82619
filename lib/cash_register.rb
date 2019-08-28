require "pry"
class CashRegister
    attr_accessor :total , :items , :price
    attr_reader :discount
    
    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
    end

    def discount
        @discount = 20
    end

    def cash_register
        CashRegister.new
    end

    def cash_register_with_discount(discount)
        CashRegister.new(discount)
    end

    def add_item(item, price, quantity = 1)
        @price = price 
        @total_price = price * quantity 
        count = 1
        while count <= quantity
            @items << item
            count += 1
        end  
        @total += @total_price 
    end

    def apply_discount
        if @discount > 0
        @total = @total * (1 - @discount.fdiv(100))
        "After the discount, the total comes to $#{@total.floor}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @total_price
    end

end