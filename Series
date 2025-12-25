defmodule StringSeries do
  @spec slices(String.t(), non_neg_integer()) :: list(String.t())
  def slices(series, n) when n > 0 do
    length = String.length(series)

    if n > length do
      []
    else
      0..(length - n)
      |> Enum.map(fn i -> String.slice(series, i, n) end)
    end
  end

  # jeśli ktoś poda n <= 0, też zwracamy []
  def slices(_series, n) when n <= 0, do: []
end
