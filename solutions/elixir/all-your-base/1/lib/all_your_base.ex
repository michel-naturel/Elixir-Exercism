defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, input_base, _output_base) when input_base < 2 do
    {:error, "input base must be >= 2"}
  end

  def convert(_digits, _input_base, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end

  def convert([], _input_base, _output_base), do: {:ok, [0]}

  def convert(digits, input_base, output_base) do
    if Enum.any?(digits, fn d -> d < 0 or d >= input_base end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      decimal = Enum.reduce(digits, 0, &(&2 * input_base + &1))
      {:ok, to_base(decimal, output_base)}
    end
  end

  # Konwersja z dziesiętnego na dowolną bazę
  defp to_base(0, _base), do: [0]

  defp to_base(decimal, base), do: to_base(decimal, base, [])

  defp to_base(0, _base, acc), do: acc

  defp to_base(decimal, base, acc) do
    to_base(div(decimal, base), base, [rem(decimal, base) | acc])
  end
end
