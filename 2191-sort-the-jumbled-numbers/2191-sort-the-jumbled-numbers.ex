defmodule Solution do
  @spec sort_jumbled(mapping :: [integer], nums :: [integer]) :: [integer]
  def sort_jumbled(mapping, nums) do
    mapping = List.to_tuple(mapping)
    mv = Enum.map(nums, &mapped_value(&1, 1, 0, mapping))
    |> IO.inspect()

    nums
    |> Enum.zip(mv)
    |> Enum.sort_by(&elem(&1, 1))
    |> Enum.map(fn {ori, _} -> ori end)
  end

  def mapped_value(num, cur, acc, mapping) do
    next = cur * 10
    digit = num |> rem(next) |> div(cur)
    num = num - (digit * cur)
    acc = acc + elem(mapping, digit) * cur
    case num do
      0 -> acc 
      _ -> mapped_value(num, next, acc, mapping)
    end
  end
end