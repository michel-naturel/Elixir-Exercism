defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise(ArgumentError, message: "there is no zeroth prime")

  def nth(count) do
    find_prime(2, count)
  end

  defp find_prime(current, count) do
    if prime?(current) do
      if count == 1 do
        current
      else
        find_prime(current + 1, count - 1)
      end
    else
      find_prime(current + 1, count)
    end
  end

  defp prime?(n) when n < 2, do: false
defp prime?(2), do: true

defp prime?(n) do
  limit = :math.sqrt(n) |> floor()

  if limit < 2 do
    true
  else
    Enum.all?(2..limit, fn x ->
      rem(n, x) != 0
    end)
  end
end

  

 
end
