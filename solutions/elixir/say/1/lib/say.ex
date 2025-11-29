defmodule Say do
  @moduledoc """
  Translate a positive integer into English.
  """

  @ones %{
    0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
    5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"
  }

  @teens %{
    10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen",
    14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
    18 => "eighteen", 19 => "nineteen"
  }

  @tens %{
    20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty",
    60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety"
  }

  @scales ["", "thousand", "million", "billion"]

  @spec in_english(integer) :: {:ok, String.t()} | {:error, String.t()}
  def in_english(n) when n in 0..999_999_999_999, do: {:ok, large_number(n)}
  def in_english(_), do: {:error, "number is out of range"}

  # liczby < 100
  defp two_digit(n) when n < 10, do: @ones[n]
  defp two_digit(n) when n < 20, do: @teens[n]
  defp two_digit(n) do
    tens = div(n, 10) * 10
    ones = rem(n, 10)
    @tens[tens] <> if ones > 0, do: "-" <> @ones[ones], else: ""
  end

  # liczby < 1000
  defp three_digit(n) when n < 100, do: two_digit(n)
  defp three_digit(n) do
    hundreds = div(n, 100)
    remainder = rem(n, 100)
    @ones[hundreds] <> " hundred" <> if remainder > 0, do: " " <> two_digit(remainder), else: ""
  end

  # naprawdę duże liczby
  defp large_number(0), do: @ones[0]
  defp large_number(n) when n < 1000, do: three_digit(n)
  defp large_number(n) do
    digits = Integer.digits(n)

    # grupowanie po 3 od końca (jedności)
    chunks =
      digits
      |> Enum.reverse()
      |> Enum.chunk_every(3)
      |> Enum.map(&Enum.reverse/1)
      |> Enum.map(&Integer.undigits/1)
      |> Enum.reverse()

    # przypisanie skali
    chunks
    |> Enum.with_index()
    |> Enum.map(fn {num, idx} ->
      if num > 0 do
        word = three_digit(num)
        scale = Enum.at(@scales, length(chunks) - 1 - idx, "")
        if scale != "", do: word <> " " <> scale, else: word
      else
        nil
      end
    end)
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" ")
  end
end
