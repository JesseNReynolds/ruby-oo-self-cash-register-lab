class CashRegister

    attr_reader :discount, :total

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = {}
    end

    def total=(num)
    #     totaling_array = []

    #     items.each do |item, price_and_quantity|
    #       totaling_array = price_and_quantity[0] * price_and_quantity[1]
    #     end

    #    @total = totaling_array.reduce(:+)

       @total = num
    end


    def add_item(item, price, quantity = 1)
        @items[item] = [price, quantity]
        @total = @total + (price * quantity)
    end

    def apply_discount
        if @discount != 0
            @total = @total.to_f - (@total.to_f * (@discount.to_f / 100.0))
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        array_of_items = []
        @items.each do |item, price_and_quantity|
            i=0
            while i < price_and_quantity[1]
                array_of_items << item
                i = i + 1
            end
        end
        return array_of_items
    end

    def void_last_transaction
        working_array = []
        @items.each { |item, price_and_quantity| working_array << item}
        target = working_array.pop
        @total = @total - (@items[target][0] * @items[target][1])
        @items.delete(target)
        return @total
    end
end
