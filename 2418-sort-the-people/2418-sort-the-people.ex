defmodule Solution do
  @spec sort_people(names :: [String.t], heights :: [integer]) :: [String.t]
  def sort_people(names, heights) do
    [names, heights]
    |> Enum.zip()
    |> Enum.sort_by(fn x -> elem(x, 1) end, :desc)
    |> Enum.map(fn x -> elem(x, 0) end)
    # |> IO.inspect()
  end
end