defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """

  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""

  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map(fn chunk ->
      count = length(chunk)
      char = hd(chunk)

      if count == 1 do
        char
      else
        Integer.to_string(count) <> char
      end
    end)
    |> Enum.join()
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.graphemes()
    |> Enum.reduce({[], ""}, fn char, {acc, number} ->
      if char =~ ~r/\d/ do
        {acc, number <> char}
      else
        count =
          case number do
            "" -> 1
            _ -> String.to_integer(number)
          end

        {[String.duplicate(char, count) | acc], ""}
      end
    end)
    |> elem(0)
    |> Enum.reverse()
    |> Enum.join()
  end
end
