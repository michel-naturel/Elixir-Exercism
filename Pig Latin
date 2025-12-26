defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @vowels ~r/^[aeiou]/
  @rule1  ~r/^(xr|yt)/
  @rule3  ~r/^([^aeiou]*qu)(.+)/
  @rule4  ~r/^([^aeiou]+)(y.+)/
  @rule2  ~r/^([^aeiou]+)(.+)/
  
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      word =~ @vowels or word =~ @rule1 ->
        word <> "ay"

      Regex.match?(@rule3, word) ->
        [_, start, rest] = Regex.run(@rule3, word)
        rest <> start <> "ay"

      Regex.match?(@rule4, word) ->
        [_, start, rest] = Regex.run(@rule4, word)
        rest <> start <> "ay"

      
      Regex.match?(@rule2, word) ->
        [_, start, rest] = Regex.run(@rule2, word)
        rest <> start <> "ay"
    end
  end
end
