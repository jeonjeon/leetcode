defmodule Solution do
  @spec find_diagonal_order(mat :: [[integer]]) :: [integer]
  def find_diagonal_order(mat) do
    recur(0, 0, length(mat) - 1, length(hd(mat)) - 1, true, mat)
  end
  
  defp recur(i, j, m, n, true, mat) do
    cur = mat |> Enum.at(i) |> Enum.at(j)
    
    cond do
      i == m and j == n -> [cur]
      j == n -> [cur | recur(i + 1, j, m, n, false, mat)]
      i == 0 -> [cur | recur(i, j + 1, m, n, false, mat)]
      true -> [cur | recur(i - 1, j + 1, m, n, true, mat)]
    end
  end
  
  defp recur(i, j, m, n, false, mat) do
    cur = mat |> Enum.at(i) |> Enum.at(j)
    
    cond do
      i == m and j == n -> [cur]
      i == m -> [cur | recur(i, j + 1, m, n, true, mat)]
      j == 0 -> [cur | recur(i + 1, j, m, n, true, mat)]
      true -> [cur | recur(i + 1, j - 1, m, n, false, mat)]
    end
  end
end