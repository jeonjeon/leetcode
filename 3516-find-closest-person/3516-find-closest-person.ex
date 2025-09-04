defmodule Solution do
  @spec find_closest(x :: integer, y :: integer, z :: integer) :: integer
  def find_closest(x, y, z) do
    x = abs(x - z)
    y = abs(y - z)
    cond do
      x < y -> 1
      y < x -> 2
      true -> 0
    end
  end
end