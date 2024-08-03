defmodule Solution do
  @spec can_be_equal(target :: [integer], arr :: [integer]) :: boolean
  def can_be_equal(target, arr) do
    arr = Enum.sort(arr)
    target = Enum.sort(target)
    arr == target
  end
end