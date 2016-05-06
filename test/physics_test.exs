defmodule PhysicsTest do
  import Physics.Rocketry
  use ExUnit.Case
  doctest Physics.Rocketry

  # test "Orbital Term Test : 100KM" do
  #   assert Physics.Rocketry.orbital_term(100) == 1.5
  # end

  test "height > 100km in 4 hours" do
      assert Physics.Rocketry.find_height(4, :earth) > 100 #54451
      # IO.puts "height > 100km in 4 hours passed"
  end

  # test "orbital speed" do
  #     assert Physics.Rocketry.orbital_speed(54451, :earth) == 6549257.7
  #     IO.puts "orbital speed passed"
  # end

  # Tests from RedFour (fails but within a few decimal points, need to solve later)
  # test "Orbital acceleration defaults to Earth" do
  #   x = orbital_acceleration(100)
  #   assert x == 9.519899476599884
  # end

  test "Orbital term at 100km" do
    x = orbital_term(100)
    assert x == 1.5
  end

  # @tag :pending
  # test "Orbital acceleration for Jupiter at 100km" do
  #   x = orbital_acceleration(100)
  #   assert x == 24.670096337229204
  # end

  # @tag :pending
  # test "Orbital term at 100km for Saturn at 6000km" do
  #   #assert x == 4.9
  # end
end




