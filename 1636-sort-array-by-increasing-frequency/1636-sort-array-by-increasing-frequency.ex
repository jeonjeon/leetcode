defmodule Solution do
  @spec frequency_sort(nums :: [integer]) :: [integer]
  def frequency_sort(nums) do
    nums
    |> Enum.frequencies()
    |> Enum.into([])
    |> Enum.sort_by(&{elem(&1, 1), -elem(&1, 0)})
    |> Enum.flat_map(fn {a, b} -> List.duplicate(a, b) end)
    # |> IO.inspect()
  end
end