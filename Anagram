defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do

    base_down = String.downcase(base)
    base_sorted = sort_letters(base_down)

    Enum.filter(candidates, fn word ->
      word_down = String.downcase(word)

      word_down != base_down and
        sort_letters(word_down) == base_sorted
    end)
    end

  defp sort_letters(word) do
    word
    |> String.graphemes()
    |> Enum.sort()
  
  end
end
