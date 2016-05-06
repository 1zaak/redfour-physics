defmodule PlanetTest do
  use ExUnit.Case
  doctest Planet

 #  test "earth data" do
 #    assert Planet.load(:earth) == %Planet{ev: 11.2, name: "Earth", mass: 5.972e24, radius: 6.37e6, type: :rocky}
 #    IO.puts "Show earth in module attributes passed"
 #  end

 #  test "load all planets" do
 #    assert Planet.load == [earth: %Planet{ev: 11.2, mass: 5.972e24, name: "Earth", radius: 6.37e6, type: :rocky},
 #            mars: %Planet{ev: 5.1, mass: 6.39e23, name: "Mars", radius: 3.4e6, type: :rocky},
 #            moon: %Planet{ev: 2.4, mass: 7.35e22, name: "Moon", radius: 1.738e6, type: :rocky},
 #            mercury: %Planet{ev: 4.3, mass: 3.3e23, name: "Mercury", radius: 2.439e6, type: :rocky},
 #            venus: %Planet{ev: 10.4, mass: 4.86e24, name: "Venus", radius: 6.05e6, type: :rocky},
 #            jupiter: %Planet{ev: 59.5, mass: 1.89e27, name: "Jupiter", radius: 7.14e7, type: :gaseous},
 #            saturn: %Planet{ev: 35.5, mass: 5.68e26, name: "Saturn", radius: 6.02e7, type: :gaseous},
 #            uranus: %Planet{ev: 21.4, mass: 8.68e25, name: "Uranus", radius: 2.55e7, type: :gaseous},
 #            neptune: %Planet{ev: 21.4, mass: 8.68e25, name: "Uranus", radius: 2.55e7, type: :gaseous}]
 #    IO.puts "Show all planets passed"
 #  end

 # test "select individual planet" do
 #    assert Planet.select(:earth) == {:earth, %Planet{ev: 11.2, mass: 5.972e24, name: "Earth", radius: 6.37e6, type: :rocky}}
 #    IO.puts "Select earth in list"
 #  end

 #  test "select individual planet by key" do
 #    assert Planet.select[:earth] == %Planet{ev: 11.2, mass: 5.972e24, name: "Earth", radius: 6.37e6, type: :rocky}
 #    IO.puts "Select earth in list by key"
 #  end

end