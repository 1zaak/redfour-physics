defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "Escape Velocity Test : Earth" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
    
  end

  test "Escape Velocity Test : Mars" do
    
    assert Physics.Rocketry.escape_velocity(%{mass: 6.39e23, radius: 3.4e6}) == 5.1
    
  end

  test "Escape Velocity Test : Moon" do
    
    assert Physics.Rocketry.escape_velocity(%{mass: 7.35e22, radius: 1.738e6}) == 2.4
    
  end

  test "Orbital Term Test : 100KM" do
    
    assert Physics.Rocketry.orbital_term(100) == 1.5
    
  end

  test "Height more than 100km in 1.5 hours for calculating height for 4 hours" do
      assert Physics.Rocketry.find_height(4, :earth) > 100   
      
  end

  test "Moon can be calculated" do
  assert Physics.Rocketry.escape_velocity(:moon) == 2.4  
  end
  
  test "Mars can be calculated" do
  assert Physics.Rocketry.escape_velocity(:mars) == 5.1  
  end
end


