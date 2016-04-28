defmodule SolarTest do
  # use ExUnit.Case, async: true
  use ExUnit.Case
  use Timex
  doctest Solar

  setup do
    flares = [
      %{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
      %{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
      %{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
      %{classification: :X, scale: 45, date: Date.from({2003, 11, 4})},
    ]
    {:ok, data: flares}
  end

  test "8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "solar flare classfication X" do
    assert Solar.power(%{classification: :X, scale: 99}) == 99000 
    IO.puts "Solar flare classification X passed"
  end

  test "solar flare classfication M" do
    assert Solar.power(%{classification: :M, scale: 99}) == 990
    IO.puts "Solar flare classification M passed"
  end

   test "solar flare classfication C" do
    assert Solar.power(%{classification: :C, scale: 99}) == 99
    IO.puts "Solar flare classification C passed"
  end

  test "go inside", %{data: flares} do
     d = Solar.no_eva(flares) 
     assert length(d) == 3
     IO.puts "Don't go out: passed"
  end

  test "max solar flare", %{data: flares} do
    assert Solar.deadliest(flares) == 99000
    IO.puts "Deadliest flare: passed"
  end
end