defmodule Atbash do
  @alphabet ?a..?z |> Enum.to_list()
  @reversed Enum.reverse(@alphabet)

  @mapping Enum.zip(@alphabet, @reversed) |> Map.new()

  # ===== ENCODE =====
  def encode(text) do
    text
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.filter(&valid_char?/1)
    |> Enum.map(&transform/1)
    |> Enum.chunk_every(5)
    |> Enum.map(&to_string/1)
    |> Enum.join(" ")
  end

  # ===== DECODE =====
  def decode(text) do
    text
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.filter(&valid_char?/1)
    |> Enum.map(&transform/1)
    |> to_string()
  end

  # ===== HELPERS =====
  defp valid_char?(c), do: c in ?a..?z or c in ?0..?9

  defp transform(c) when c in ?a..?z, do: @mapping[c]
  defp transform(c), do: c
end
