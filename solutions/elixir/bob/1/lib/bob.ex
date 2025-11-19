defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      String.upcase(input) == input and String.downcase(input) != input and String.ends_with?(input,"?") -> "Calm down, I know what I'm doing!"
      String.ends_with?(String.trim(input),"?") -> "Sure."
      String.trim(input) == ""
 -> "Fine. Be that way!"
      String.upcase(input) == input and String.downcase(input) != input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
