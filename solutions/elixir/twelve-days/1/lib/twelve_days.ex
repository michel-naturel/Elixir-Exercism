defmodule TwelveDays do
  @days ~w(
    first second third fourth fifth sixth
    seventh eighth ninth tenth eleventh twelfth
  )

  @gifts [
    "a Partridge in a Pear Tree.",
    "two Turtle Doves, ",
    "three French Hens, ",
    "four Calling Birds, ",
    "five Gold Rings, ",
    "six Geese-a-Laying, ",
    "seven Swans-a-Swimming, ",
    "eight Maids-a-Milking, ",
    "nine Ladies Dancing, ",
    "ten Lords-a-Leaping, ",
    "eleven Pipers Piping, ",
    "twelve Drummers Drumming, "
  ]

  @spec verse(integer) :: String.t()
  def verse(1) do
    "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
  end

  def verse(n) when n > 1 do
    gifts =
      @gifts
      |> Enum.take(n)
      |> Enum.reverse()
      |> Enum.join()
      |> String.replace_suffix(@gifts |> hd(), "and #{@gifts |> hd()}")

    "On the #{@days |> Enum.at(n - 1)} day of Christmas my true love gave to me: #{gifts}"
  end

  @spec verses(integer, integer) :: String.t()
  def verses(starting, ending) do
    Enum.map_join(starting..ending, "\n", &verse/1)
  end

  @spec sing() :: String.t()
  def sing(), do: verses(1, 12)
end
