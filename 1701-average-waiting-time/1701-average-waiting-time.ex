defmodule Solution do
  @spec average_waiting_time(customers :: [[integer]]) :: float
  def average_waiting_time(customers) do
    customers
    |> Enum.reduce({0, 0}, &sum_and_wait/2)
    |> (fn {_, wait} -> wait / length(customers) end).()
  end
  defp sum_and_wait([arv, t], {sum, wait}) do
    pre_sum = max(sum, arv)
    {pre_sum + t, pre_sum + wait + t - arv}
  end
end