defmodule BottleSong do
  @moduledoc """
  Handles lyrics of the popular children song: Ten Green Bottles
  """

  @spec recite(pos_integer, pos_integer) :: String.t()
  
  def recite(_start_bottle, 0), do: ""
  
  def recite(start_bottle, take_down) do

  number_words_c = %{
    0 => "No",
    1 => "One",
    2 => "Two",
    3 => "Three",
    4 => "Four",
    5 => "Five",
    6 => "Six",
    7 => "Seven",
    8 => "Eight",
    9 => "Nine",
    10 => "Ten"
  }

  number_words_m = %{
    0 => "no",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten"
  }
  
      first_number = Map.get(number_words_c, start_bottle)
      second_number = Map.get(number_words_m, start_bottle-1)
      
      the_s_1 = if start_bottle <= 1, do: "", else: "s"
      the_s_2 = if (start_bottle - 1) == 1, do: "", else: "s"

      verse = "#{first_number} green bottle#{the_s_1} hanging on the wall,\n#{first_number} green bottle#{the_s_1} hanging on the wall,\nAnd if one green bottle should accidentally fall,\nThere'll be #{second_number} green bottle#{the_s_2} hanging on the wall."

      if take_down > 1 do
        verse <> "\n\n" <> recite(start_bottle - 1, take_down - 1)
      else
        verse
      end
  
  end
end
