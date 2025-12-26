defmodule Garden do
  @plants %{
    "G" => :grass,
    "C" => :clover,
    "R" => :radishes,
    "V" => :violets
  }

  @default_students [
    :alice, :bob, :charlie, :david, :eve, :fred,
    :ginny, :harriet, :ileana, :joseph, :kincaid, :larry
  ]

  @spec info(String.t(), list(atom) | nil) :: map
  def info(info_string, student_names \\ @default_students) do
    sorted_students = Enum.sort(student_names)

   
    initial_map =
      Enum.reduce(sorted_students, %{}, fn student, acc ->
        Map.put(acc, student, {})
      end)

    rows =
      info_string
      |> String.split("\n", trim: true)

    [row1, row2] =
      case rows do
        [r1, r2] -> [r1, r2]
        [r1] -> [r1, ""]
        _ -> ["", ""]
      end

    row1_chunks = chunk_string(row1, 2)
    row2_chunks = chunk_string(row2, 2)

    Enum.zip(row1_chunks, row2_chunks)
    |> Enum.with_index()
    |> Enum.reduce(initial_map, fn {{r1, r2}, idx}, acc ->
      student = Enum.at(sorted_students, idx)
      plants = (r1 ++ r2) |> Enum.map(&Map.get(@plants, &1))
      Map.put(acc, student, List.to_tuple(plants))
    end)
  end

  defp chunk_string(str, n) do
    str
    |> String.graphemes()
    |> Enum.chunk_every(n)
  end
end
