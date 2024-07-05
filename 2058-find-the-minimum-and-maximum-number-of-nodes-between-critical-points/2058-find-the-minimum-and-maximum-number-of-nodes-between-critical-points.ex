# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec nodes_between_critical_points(head :: ListNode.t | nil) :: [integer]
  def nodes_between_critical_points(head) do
    head
    |> Stream.unfold(fn 
      nil -> nil
      %ListNode{val: val, next: next} -> {val, next}
    end)
    |> Enum.to_list()
    |> Enum.with_index()
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.reduce([], fn [{prev, _}, {cur, idx}, {next, _}], acc ->
      cond do
        cur > prev and cur > next -> [idx | acc]
        cur < prev and cur < next -> [idx | acc]
        true -> acc
      end
    end)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce({99999, 0, 99999}, fn [first, last], {mn, mx, mini} ->
      {min(mn, last), max(mx, first), min(mini, first - last)}
    end)
    |> (fn 
        {99999, 0, 99999} -> [-1, -1]
        {mn, mx, mini} -> [mini, mx - mn]
    end).()
  end
end