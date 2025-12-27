defmodule Allergies do
  use Bitwise

  @allergens %{
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128
  }

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    @allergens
    |> Enum.filter(fn {_item, value} ->
      (flags &&& value) != 0
    end)
    |> Enum.map(fn {item, _value} -> item end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    case Map.get(@allergens, item) do
      nil -> false
      value -> (flags &&& value) != 0
    end
  end
end
