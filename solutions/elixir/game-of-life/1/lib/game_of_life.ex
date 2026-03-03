defmodule GameOfLife do
  @doc """
  Apply the rules of Conway's Game of Life to a grid of cells
  """

  @spec tick(matrix :: list(list(0 | 1))) :: list(list(0 | 1))
  def tick([]), do: []

  def tick(matrix) do
    rows = length(matrix)
    cols = length(hd(matrix))

    for r <- 0..(rows - 1) do
      for c <- 0..(cols - 1) do
        cell = get_cell(matrix, r, c)
        neighbors = live_neighbors(matrix, r, c)

        next_cell(cell, neighbors)
      end
    end
  end

  # ---- Funkcje pomocnicze ----

  defp next_cell(1, neighbors) when neighbors in [2, 3], do: 1
  defp next_cell(0, 3), do: 1
  defp next_cell(_, _), do: 0

  defp live_neighbors(matrix, row, col) do
    for dr <- -1..1,
        dc <- -1..1,
        not (dr == 0 and dc == 0),
        reduce: 0 do
      acc ->
        acc + get_cell(matrix, row + dr, col + dc)
    end
  end

  defp get_cell(matrix, row, col) do
    cond do
      row < 0 or col < 0 -> 0
      row >= length(matrix) -> 0
      col >= length(hd(matrix)) -> 0
      true -> matrix |> Enum.at(row) |> Enum.at(col)
    end
  end
end
