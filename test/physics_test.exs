defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "Escape Velocity Test : Earth" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
    IO.puts "Escape velocity  calculation passed: Earth"
  end

  test "Escape Velocity Test : Mars" do
    
    assert Physics.Rocketry.escape_velocity(%{mass: 6.39e23, radius: 3.4e6}) == 5.1
    IO.puts "Escape velocity calculation passed: Mars"
  end

  test "Escape Velocity Test : Moon" do
    
    assert Physics.Rocketry.escape_velocity(%{mass: 7.35e22, radius: 1.738e6}) == 2.4
    IO.puts "Escape velocity calculation passed: Moon"
  end

  test "Orbital Term Test : 100KM" do
    
    assert Physics.Rocketry.orbital_term(100) == 1.5
    IO.puts "Orbital term calculation passed : 1.5 minutes in 100KM"
  end
end
