prices = [17,6,3,15,9,8,6,1,10]

def stock_picker(prcs)
    highest_profit = 0
    buying_index = 0
    selling_index = 0
    prcs.each_with_index do | price1, index1 |
        starting_index = index1
        prcs.each_with_index do | price2, index2 |
            if index2 >= starting_index
                profit = -price1 + price2
                if profit > highest_profit
                    highest_profit = profit
                    buying_index = index1
                    selling_index = index2
                end 
            end 
        end 
    end
    return [buying_index, selling_index]
end

p stock_picker(prices)