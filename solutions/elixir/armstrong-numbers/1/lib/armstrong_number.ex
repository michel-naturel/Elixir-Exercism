defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(0), do: true
  def valid?(number) do

  digits_list = Integer.digits(number)
  digits_number = length(digits_list)

  sum = Enum.reduce(digits_list, 0, fn x, acc ->
  acc + x ** digits_number
end)
  
  cond do
    digits_number == 1 -> true
    sum == number -> true
    sum != number -> false
  end
  
  end
end
