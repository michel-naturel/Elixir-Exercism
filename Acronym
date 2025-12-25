defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> then(&Regex.scan(~r/(?:^|[ _-])([A-Za-z])/ , &1))
    |> Enum.map(fn [_, letter] -> String.upcase(letter) end) 
    |> Enum.join("")

  end
end
