defmodule Solution do
  @spec lucky_numbers(matrix :: [[integer]]) :: [integer]
  def lucky_numbers (matrix) do
    column = matrix
    |> Enum.map(&Enum.min/1)
    |> MapSet.new()
    # |> IO.inspect()
    
    row = matrix
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.max/1)
    |> MapSet.new()
    # |> IO.inspect()

    MapSet.intersection(column, row)
    |> MapSet.to_list()
  end
end