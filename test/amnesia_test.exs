defmodule AmnesiaTest do
  use ExUnit.Case
  use Physics.Database

  setup_all do

    Amnesia.Schema.create
    Amnesia.start
    Physics.Database.create!

    res = Amnesia.transaction! do
      planets = [
        %Planet{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6},
        %Planet{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6},
        %Planet{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6},
        %Planet{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6},
        %Planet{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7},
        %Planet{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7},
        %Planet{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7},
        %Planet{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}
      ]
      for planet <- planets, do: planet |> Planet.write!
      IO.puts "Amnesia created"
    end

    on_exit fn ->
      Physics.Database.destroy
      Amnesia.stop
      Amnesia.Schema.destroy
      IO.puts "Amnesia destroyed"
    end

    :ok
  end

  test "It can read the planet using id 1" do
  p = Amnesia.transaction! do
    Planet.read(1)
  end
  assert p.id == 1
  IO.puts "amnesia database read passed"
  end

  test "it reads rocky planet with a match" do
    planets = Amnesia.transaction! do
      [type: :rocky] |> Planet.match
    end
    assert length(planets.values) == 4
    IO.puts "read 4 rocky planets from mnesia passed"
  end

  test "using where" do
    planets = Amnesia.transaction! do
      Planet.where(type == :gaseous)
    end 
    assert length(planets.values) == 4
    IO.puts "using where passed"
  end

  test "first and next" do
    p = Amnesia.transaction! do
      Planet.first |> Planet.next
    end 
    assert p.id == 2
    IO.puts "first and next passed"
  end

end