defmodule Solution do
  @spec num_water_bottles(num_bottles :: integer, num_exchange :: integer) :: integer
  def num_water_bottles(num_bottles, num_exchange) do
    num_water_bottles(num_bottles, num_exchange, num_bottles)
  end
  def num_water_bottles(res, num_exchange, empty_bottles) when num_exchange <= empty_bottles do
    bottles = div(empty_bottles, num_exchange)
    empty = rem(empty_bottles, num_exchange)
    num_water_bottles(res + bottles, num_exchange, bottles + empty)
  end
  def num_water_bottles(res, _, _) do
    res
  end
end