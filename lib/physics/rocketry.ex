defmodule Physics.Rocketry do

  import Calcs
  import Physics.Laws
  import Planet

  @earth select[:earth]
  @mars select[:mars]
  @moon select[:moon]
  @mercury select[:mercury]
  @venus select[:venus]
  @jupiter select[:jupiter]
  @saturn select[:saturn]
  @uranus select[:uranus]
  @neptune select[:neptune]

  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
  end

  def orbital_speed(height) do
    newtons_gravitational_constant * select[:earth].mass / orbital_radius(height) 
    |> square_root
  end

  def orbital_term(height) do
    4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (newtons_gravitational_constant * select[:earth].mass)
    |> square_root
    |> seconds_to_hours
  end

  def find_height(orbital_term_hours, planet) do
    (newtons_gravitational_constant * select[planet].mass * (orbital_term_hours |> squared)) / (4 * (:math.pi |> squared))
    |> cube_root
  end

  defp orbital_radius(height) do
    select[:earth].radius + (height |> to_m) 
  end

end
