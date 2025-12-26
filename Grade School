defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: %{integer => [String.t()]}

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new() do
    %{}  # pusty słownik reprezentuje pustą szkołę
  end

  @doc """
  Add a student to a particular grade in school.
  """
@spec add(school, String.t(), integer) :: {:ok | :error, school}
def add(school, name, grade) do
  # Sprawdź, czy uczeń jest już gdziekolwiek w szkole
  already_in_school =
    school
    |> Map.values()
    |> Enum.any?(fn students -> name in students end)

  if already_in_school do
    {:error, school}
  else
    students_in_grade = Map.get(school, grade, [])
    updated_school = Map.put(school, grade, students_in_grade ++ [name])
    {:ok, updated_school}
  end
end


  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school
    |> Map.get(grade, [])
    |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    school
    |> Enum.sort_by(fn {grade, _students} -> grade end)  # sortuj wg klas
    |> Enum.flat_map(fn {_grade, students} -> Enum.sort(students) end)  # sortuj studentów w klasach
  end
end
