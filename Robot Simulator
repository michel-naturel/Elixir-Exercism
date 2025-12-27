defmodule RobotSimulator do
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}
  @type robot() :: %{direction: direction(), position: position()}

  @directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, position) do
    cond do
      not valid_direction?(direction) ->
        {:error, "invalid direction"}

      not valid_position?(position) ->
        {:error, "invalid position"}

      true ->
        %{direction: direction, position: position}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.
  """
  @spec simulate(robot, String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, instructions) do
    instructions
    |> String.graphemes()
    |> Enum.reduce_while(robot, fn
      "R", acc -> {:cont, turn_right(acc)}
      "L", acc -> {:cont, turn_left(acc)}
      "A", acc -> {:cont, advance(acc)}
      _, _ -> {:halt, {:error, "invalid instruction"}}
    end)
  end

  @doc """
  Return the robot's direction.
  """
  @spec direction(robot) :: direction()
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot), do: robot.position

  ## ===== Funkcje pomocnicze =====

  defp valid_direction?(dir) do
    dir in @directions
  end

  defp valid_position?({x, y}) when is_integer(x) and is_integer(y), do: true
  defp valid_position?(_), do: false

  defp turn_right(%{direction: dir} = robot) do
    idx = Enum.find_index(@directions, &(&1 == dir))
    %{robot | direction: Enum.at(@directions, rem(idx + 1, 4))}
  end

  defp turn_left(%{direction: dir} = robot) do
    idx = Enum.find_index(@directions, &(&1 == dir))
    %{robot | direction: Enum.at(@directions, rem(idx + 3, 4))}
  end

  defp advance(%{direction: :north, position: {x, y}} = robot),
    do: %{robot | position: {x, y + 1}}

  defp advance(%{direction: :east, position: {x, y}} = robot),
    do: %{robot | position: {x + 1, y}}

  defp advance(%{direction: :south, position: {x, y}} = robot),
    do: %{robot | position: {x, y - 1}}

  defp advance(%{direction: :west, position: {x, y}} = robot),
    do: %{robot | position: {x - 1, y}}
end
