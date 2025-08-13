defmodule Solution do
  @spec is_power_of_three(n :: integer) :: boolean
  def is_power_of_three(n) do
    if n < 1 do
      false
    else 
      recur(n)
    end
  end
  def recur(n) do
    case n do
      1 -> true
      x when rem(n, 3) != 0 -> false
      _ -> recur(div(n, 3))
    end
  end
end