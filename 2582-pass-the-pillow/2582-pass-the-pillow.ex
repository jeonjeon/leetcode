defmodule Solution do
  @spec pass_the_pillow(n :: integer, time :: integer) :: integer
  def pass_the_pillow(n, time) do
    path = n - 1
    mod = rem(time, path)
    cnt = div(time, path)
    if rem(cnt, 2) == 1 do
      n - mod
    else
      1 + mod
    end
  end
end