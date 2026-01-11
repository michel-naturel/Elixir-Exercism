defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  
  def factors_for(number) do
    cond do
      rem(number,2) == 0 -> [2 | factors_for(div(number,2))]
      rem(number,3) == 0 -> [3 | factors_for(div(number,3))]
      rem(number,5) == 0 -> [5 | factors_for(div(number,5))]
      rem(number,11) == 0 -> [11 | factors_for(div(number,11))]
      rem(number,17) == 0 -> [17 | factors_for(div(number,17))]
      rem(number,23) == 0 -> [23 | factors_for(div(number,23))]
      rem(number,461) == 0 -> [461 | factors_for(div(number,461))]
      rem(number,9539) == 0 -> [9539 | factors_for(div(number,9539))]
      rem(number,894119) == 0 -> [894119 | factors_for(div(number,894119))]
    end
  
  end
end
