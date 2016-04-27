defmodule Physics.Rocketry do

  import Calcs
  import Physics.Laws
  import Planets

  def escape_velocity(:earth) do
    #Earth's Mass = 5.972e24
    earth
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  def orbital_speed(height) do
    newtons_gravitational_constant * earth.mass / orbital_radius(height)
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
  end

  def orbital_term(height) do
    4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (newtons_gravitational_constant * earth.mass)
    |> square_root
    |> seconds_to_hours
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    # 2 * 6.67e-11 * 5.972e24 (Earth's mass) / 6.37e6 (Earth's radius)
    # 2 * -51450865.541591791 * 22501488.1662211464 / 14065372.891919538 = 14065372.891919538
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(height) do
    earth.radius + (height |> to_m)
  end

end
