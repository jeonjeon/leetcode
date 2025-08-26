defmodule Solution do
  @spec area_of_max_diagonal(dimensions :: [[integer]]) :: integer
  def area_of_max_diagonal(dimensions) do
    dimensions
    |> recur()
    |> Enum.map(fn [x, y] -> x * y end)
    |> Enum.reduce(&max/2)
  end

  defp recur([head | []]) do
    [head]
  end
  defp recur([[x, y] | tail]) do
    nexts = recur(tail)
    [x2, y2] = hd(nexts)
    cond do
      x ** 2 + y ** 2 > x2 ** 2 + y2 ** 2 -> [[x, y]]
      x ** 2 + y ** 2 == x2 ** 2 + y2 ** 2 -> [[x, y] | nexts]
      true -> nexts
    end
  end

end