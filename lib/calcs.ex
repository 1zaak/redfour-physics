defmodule Calcs do
  def to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  def to_integer(val) do
    Kernel.round(val)
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def to_m(val) do
    val * 1000
  end

  def square_root(val) do
    :math.sqrt(val)
  end

  def squared(val) do
    val * val
  end

  def cubed(val) do
    val * val * val
  end

  def seconds_to_hours(val) do
    val / 3600 |> to_nearest_tenth
  end

  def hours_to_days(val) do
    val / 24 |> to_nearest_tenth
  end

  def cube_root(x, precision \\ 1.0e-5) do
    f = fn(prev) -> ((3 - 1) * prev + x / :math.pow(prev, (3-1))) / 3 end
    fixed_point(f, x, precision, f.(x))
    |> to_integer
  end

  defp fixed_point(_, guess, tolerance, next) when abs(guess - next) < tolerance, do: next
  defp fixed_point(f, _, tolerance, next), do: fixed_point(f, next, tolerance, f.(next))
end
