defmodule Planet do
  
  import Calcs
  import Physics.Laws

  @earth %{name: "Earth", mass: 5.972e24, radius: 6.37e6, type: :rocky}
  @mars %{name: "Mars", mass: 6.39e23, radius: 3.4e6, type: :rocky}
  @moon %{name: "Moon", mass: 7.35e22, radius: 1.738e6, type: :rocky}
  @mercury %{name: "Mercury", mass: 3.3e23, radius: 2.439e6, type: :rocky}
  @venus %{name: "Venus", mass: 4.86e24, radius: 6.05e6, type: :rocky}
  @jupiter %{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7}
  @saturn %{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7}
  @uranus %{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}
  @neptune %{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}
  
  defstruct [
    name: "Planet",
    mass: 0,
    radius: 0,
    type: nil,
    ev: 0
  ] 

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  def escape_velocity(planet) when is_map(planet) do
    Map.merge(planet, %{ev: planet |> calculate_escape |> to_km |> to_nearest_tenth})  
  end

  def load(planet) do
    case planet do
      :earth -> Map.merge(%Planet{}, @earth) |> escape_velocity
      :mars -> Map.merge(%Planet{}, @mars) |> escape_velocity
      :moon -> Map.merge(%Planet{}, @moon) |> escape_velocity
      :mercury -> Map.merge(%Planet{}, @mercury) |> escape_velocity
      :venus -> Map.merge(%Planet{}, @venus) |> escape_velocity
      :jupiter -> Map.merge(%Planet{}, @jupiter) |> escape_velocity
      :saturn -> Map.merge(%Planet{}, @saturn) |> escape_velocity
      :uranus -> Map.merge(%Planet{}, @uranus) |> escape_velocity
      :neptune -> Map.merge(%Planet{}, @neptune) |> escape_velocity
    end
  end

  def load do
    # Enum.map [:earth, :mars, :moon, :mercury, :venus, :jupiter, :saturn, :uranus, :neptune], &({&1, load(&1)})  
    for planet <- [:earth, :mars, :moon, :mercury, :venus, :jupiter, :saturn, :uranus, :neptune], do: {planet, load(planet)}
  end

  def select(planet) do
    planets = load
    Enum.find(planets, &(elem(&1,0) == planet))
  end

  def select do
    planets = load
    planets
  end

  
end