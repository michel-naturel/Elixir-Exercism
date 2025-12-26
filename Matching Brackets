defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes()               # dzieli string na listę znaków
    |> Enum.reduce_while([], fn char, stack ->
      case char do
        "(" -> {:cont, ["(" | stack]}
        "{" -> {:cont, ["{" | stack]}
        "[" -> {:cont, ["[" | stack]}
        ")" -> check_closing(stack, "(")
        "}" -> check_closing(stack, "{")
        "]" -> check_closing(stack, "[")
        _ -> {:cont, stack}               # ignorujemy inne znaki
      end
    end)
    |> case do
      [] -> true                          # jeśli stos pusty, to wszystko zbalansowane
      _ -> false                          # jeśli coś zostało, to niezbalansowane
    end
  end

  defp check_closing([], _expected), do: {:halt, :error}  # brak otwartego nawiasu
  defp check_closing([expected | rest], expected), do: {:cont, rest}  # poprawne dopasowanie
  defp check_closing(_, _), do: {:halt, :error}           # błędne dopasowanie
end
