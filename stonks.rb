#!/bin/ruby



#
# Complete the 'processOrders' function below.
#
# The function is expected to return a 2D_DOUBLE_ARRAY.
# The function accepts 2D_STRING_ARRAY orders as parameter.
#
=begin
Input array of arrays ['Buy' || 'Sell', Quantity, Price]
Output array of arrays [Quantity, Price]

Examples:
[Buy, 3.0, 5.0] => (none)

[[Sell, 3.0, 5.0], [Buy, 3.0, 5.0]] => [[3.0, 5.0]]

[[Buy, 3.0, 5.0], [Sell, 1.0, 5.0], [Sell, 2.0, 4.9]] => [[1.0, 5.0], [2.0, 5.0]]

Diagram:
resting_buys [1.0, 5.0], [3.0, 4.9]
sell [2.0, 4.9]                     transactions [1.0, 5.0]
resting_buys [3.0, 4.9]
sell [1.0, 4.9]                     transactions [1.0, 5.0], [1.0, 4.9]
resting_buys [2.0, 4.9]
sell [2.0, 4.9]                     transactions [1.0, 5.0], [1.0, 4.9], [2.0, 4.9]

Pseudocode:
resting_buys = []
resting_sells = []
transactions = []

orders.each
    order = {order[0]: {
        quantity: order[1],
        price: order[2]
    }}

    if 'Sell'
        current_buy = resting_buys.search { |buy| buy[price] >= order.rice }
        if current_buy == null
            push sell order to resting_sells
        if current_buy != null
            subtract quantity from order
            add to transaction
            if remainder, push remainder to resting sells
    if 'Buy'
        current_sell = resting_sells.search { |sell| sell[price] <= order.price }
        if current_sell is null
            push buy order to resting_buys
        if current sell isn't null
            subtract quantity from order
            add to transaction
            if remainder, push to resting_buys

    Using minHeap for resting sells and maxHeap for resting buys could optimize this a lot
=end

# A class to handle orders
class Orders
  attr_reader :transactions

  def initialize
    @resting_buys = []
    @resting_sells = []
    @transactions = []
  end

  def add(order)
    if order.first == 'Buy'
      process_buys({ quantity: order[1], price: order[2] })
    else
      process_sells({ quantity: order[1], price: order[2] })
    end
  end

  def match_sells(order)
    @resting_sells.select { |sell| sell[:price] <= order[:price] }.sort_by{ |sell| sell[:price]}
  end

  def match_buys(order)
    @resting_buys.select { |buy| buy[:price] >= order[:price] }.sort_by!{ |buy| -buy[:price]}
  end

  def calculate_buy(order, sell)
    if order[:quantity] == sell[:quantity] && order[:quantity].positive?
      @transactions << [sell[:quantity], sell[:price]]
      order[:quantity] = 0
    elsif order[:quantity] > sell[:quantity] && order[:quantity].positive?
      @resting_buys.delete(order)
      order[:quantity] -= sell[:quantity]
      @transactions << [sell[:quantity], sell[:price]]
      @resting_buys << order
    elsif order[:quantity].positive?
      sell[:quantity] -= order[:quantity]
      @transactions << [order[:quantity], sell[:price]]
      @resting_sells << sell
      order[:quantity] = 0
    end
  end

  def process_buys(order)
    current_sells = match_sells(order)
    return @resting_buys << order if current_sells.empty?

    current_sells.each do |sell|
      @resting_sells.delete(sell)
      calculate_buy(order, sell)
    end
  end

  def calculate_sell(order, buy)
    if order[:quantity] == buy[:quantity] && order[:quantity].positive?
      @transactions << [buy[:quantity], buy[:price]]
      order[:quantity] = 0
    elsif order[:quantity] > buy[:quantity] && order[:quantity].positive?
      order[:quantity] -= buy[:quantity]
      @transactions << [buy[:quantity], buy[:price]]
      @resting_sells << order
    elsif order[:quantity].positive?
      buy[:quantity] -= order[:quantity]
      @transactions << [order[:quantity], buy[:price]]
      @resting_buys << buy
      order[:quantity] = 0
    end
  end

  def process_sells(order)
    current_buys = match_buys(order)
    return @resting_sells << order if current_buys.empty?

    current_buys.each do |buy|
      @resting_buys.delete(buy)
      calculate_sell(order, buy)
    end
  end
end

# def processOrders(orders)
#     resting_buys = []
#     resting_sells = []
#     transactions = []

#     orders.each do |order_array|
#         order = {"#{order_array[0]}": {
#             quantity: order_array[1].to_f,
#             price: order_array[2].to_f
#         }}
#         if order[:Buy]
#             current_sells = resting_sells.select { |sell| sell[:price] <= order[:Buy][:price] }.sort_by{ |sell| sell[:price]}
#             if current_sells.empty?
#                 resting_buys << order[:Buy]
#             else
#                 current_sells.each do |sell|
#                     resting_sells.delete(sell)
#                     if order[:Buy][:quantity] == sell[:quantity] && order[:Buy][:quantity].positive?
#                         transactions << [sell[:quantity], sell[:price]]
#                         order[:Buy][:quantity] = 0
#                     elsif order[:Buy][:quantity] > sell[:quantity] && order[:Buy][:quantity].positive?
#                         resting_buys.delete(order[:Buy])
#                         order[:Buy][:quantity] -= sell[:quantity]
#                         transactions << [sell[:quantity], sell[:price]]
#                         resting_buys << order[:Buy]
#                     elsif order[:Buy][:quantity].positive?
#                         sell[:quantity] -= order[:Buy][:quantity]
#                         transactions << [order[:Buy][:quantity], sell[:price]]
#                         resting_sells << sell
#                         order[:Buy][:quantity] = 0
#                     end
#                 end
#             end
#         elsif order[:Sell]
#             current_buys = resting_buys.select { |buy| buy[:price] >= order[:Sell][:price] }.sort_by!{ |buy| -buy[:price]}
#             if current_buys.empty?
#                 resting_sells << order[:Sell]
#             else
#                 current_buys.each do |buy|
#                     resting_buys.delete(buy)
#                     if order[:Sell][:quantity] == buy[:quantity] && order[:Sell][:quantity].positive?
#                         transactions << [buy[:quantity], buy[:price]]
#                         order[:Sell][:quantity] = 0
#                     elsif order[:Sell][:quantity] > buy[:quantity] && order[:Sell][:quantity].positive?
#                         order[:Sell][:quantity] -= buy[:quantity]
#                         transactions << [buy[:quantity], buy[:price]]
#                         resting_sells << order[:Sell]
#                     elsif order[:Sell][:quantity].positive?
#                         buy[:quantity] -= order[:Sell][:quantity]
#                         transactions << [order[:Sell][:quantity], buy[:price]]
#                         resting_buys << buy
#                         order[:Sell][:quantity] = 0
#                     end
#                 end
#             end
#         end
#     end
#     transactions
# end

def process_orders(orders_array)
  orders = Orders.new
  orders_array.each do |order|
    orders.add(order)
  end
  orders.transactions
end

p process_orders([['Sell', 3.0, 5.0], ['Buy', 3.0, 5.0]])
p process_orders([['Buy', 3.0, 5.0], ['Sell', 1.0, 5.0], ['Sell', 2.0, 4.9]])
