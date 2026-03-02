defmodule PhoneNumber do
  @spec clean(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def clean(raw) do
    cond do
      contains_invalid_characters?(raw) ->
        {:error, "must contain digits only"}

      true ->
        digits = String.replace(raw, ~r/\D/, "")

        cond do
          String.length(digits) < 10 ->
            {:error, "must not be fewer than 10 digits"}

          String.length(digits) > 11 ->
            {:error, "must not be greater than 11 digits"}

          String.length(digits) == 11 and not String.starts_with?(digits, "1") ->
            {:error, "11 digits must start with 1"}

          true ->
            digits
            |> normalize()
            |> validate_area_and_exchange()
        end
    end
  end

  defp contains_invalid_characters?(raw) do
    Regex.match?(~r/[^0-9\(\)\+\-\.\s]/, raw)
  end

  defp normalize(digits) do
    if byte_size(digits) == 11 and String.starts_with?(digits, "1") do
      String.slice(digits, 1..-1)
    else
      digits
    end
  end

  defp validate_area_and_exchange(<<area, _::binary>>) when area == ?0,
    do: {:error, "area code cannot start with zero"}

  defp validate_area_and_exchange(<<area, _::binary>>) when area == ?1,
    do: {:error, "area code cannot start with one"}

  defp validate_area_and_exchange(<<_::binary-size(3), exchange, _::binary>>)
       when exchange == ?0,
       do: {:error, "exchange code cannot start with zero"}

  defp validate_area_and_exchange(<<_::binary-size(3), exchange, _::binary>>)
       when exchange == ?1,
       do: {:error, "exchange code cannot start with one"}

  defp validate_area_and_exchange(digits),
    do: {:ok, digits}
end
