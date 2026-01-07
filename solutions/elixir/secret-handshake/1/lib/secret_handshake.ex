defmodule SecretHandshake do
  @actions ["wink", "double blink", "close your eyes", "jump"]

  def commands(number) when is_integer(number) and number >= 0 do
    number
    |> Integer.to_string(2)
    |> String.pad_leading(5, "0")
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.take(5)             # bierzemy tylko 5 najmniej znaczących bitów
    |> build_actions()
  end

  defp build_actions(bits) do
    {actions_bits, [reverse_bit]} = Enum.split(bits, 4)

    actions =
      actions_bits
      |> Enum.with_index()
      |> Enum.filter(fn {bit, _index} -> bit == "1" end)
      |> Enum.map(fn {_bit, index} -> Enum.at(@actions, index) end)

    if reverse_bit == "1" do
      Enum.reverse(actions)
    else
      actions
    end
  end
end
