class CashRegister
    attr_accessor :discount, :total
    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @item_list = []
    end

    def add_item (title, price, quantity = 1)
        @total += price * quantity
        quantity.times { @item_list.push(title) }
        @last_trans = {title: title, price: price, quantity: quantity}
    end

    def apply_discount
        @total *= 1 - (discount/100.0)
        if discount != 0
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @item_list
    end

    def void_last_transaction
        @item_list.pop
        @total -= @last_trans[:price] * @last_trans[:quantity]
    end
        
end
