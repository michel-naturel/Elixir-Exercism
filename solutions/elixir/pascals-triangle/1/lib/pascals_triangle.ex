defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a Pascal's triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(0), do: []

  def rows(n) when n > 0 do
    do_rows(n, [[1]])
  end

  # Rekurencyjna funkcja pomocnicza
  defp do_rows(n, triangle) when length(triangle) == n do
    triangle
  end

  defp do_rows(n, triangle) do
    last_row = List.last(triangle)
    new_row = next_row(last_row)
    do_rows(n, triangle ++ [new_row])
  end

  # Funkcja generuje nowy wiersz na podstawie poprzedniego
  defp next_row(row) do
    # dodajemy 0 z lewej i prawej aby łatwo sumować pary
    [0 | row]
    |> Enum.zip(row ++ [0])
    |> Enum.map(fn {a, b} -> a + b end)
  end
end
