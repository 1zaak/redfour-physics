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

  test "total exposure", %{data: flares} do
    assert Solar.total_exposure(flares) == 216911.7
  end

  test "sort exposure", %{data: flares} do
    assert Solar.sort_exposure(flares) == [2.5, 3.2, 12, 58, 836, 45000, 72000, 99000]
  end

  test "total exposure (recursive)", %{data: flares} do
    assert Solar.r_total_exposure(flares) == 216911.7
  end

  test "total exposure (reduce)", %{data: flares} do
    assert Solar.reduce_total_exposure(flares) == 216911.7
  end

  test "total exposure (comprehension)", %{data: flares} do
    assert Solar.c_total_exposure(flares) == 216911.7
  end

  test "flare power and deadliness", %{data: flares} do
    assert Solar.flare_deadliness(flares) == [
      power: 99000, is_deadly: true, 
      power: 58.0, is_deadly: false, 
      power: 12.0, is_deadly: false, 
      power: 3.2, is_deadly: false,
      power: 836.0, is_deadly: false, 
      power: 2.5, is_deadly: false, 
      power: 72000, is_deadly: true, 
      power: 45000, is_deadly: true]
  end

  test "a list of flares using list of tuples", %{data: flares} do
  result = Solar.flare_list(flares)
  assert result == [
    {:power, 99000, :is_deadly, true},
    {:power, 58.0, :is_deadly, false},
    {:power, 12.0, :is_deadly, false},
    {:power, 3.2, :is_deadly, false},
    {:power, 836.0, :is_deadly, false},
    {:power, 2.5, :is_deadly, false},
    {:power, 72000, :is_deadly, true},
    {:power, 45000, :is_deadly, true}
 ] 
end

test "a list of flares using list of tuples with label", %{data: flares} do
  result = Solar.label_flare_list(flares)
  assert result == [
    {:flare, :power, 99000, :is_deadly, true},
    {:flare, :power, 58.0, :is_deadly, false},
    {:flare, :power, 12.0, :is_deadly, false},
    {:flare, :power, 3.2, :is_deadly, false},
    {:flare, :power, 836.0, :is_deadly, false},
    {:flare, :power, 2.5, :is_deadly, false},
    {:flare, :power, 72000, :is_deadly, true},
    {:flare, :power, 45000, :is_deadly, true}
 ] 
end


  test "a list of flares using list of maps", %{data: flares} do
  result = Solar.maps_flare_list(flares)
  assert result == [
    %{power: 99000, is_deadly: true},
    %{power: 58.0, is_deadly: false},
    %{power: 12.0, is_deadly: false},
    %{power: 3.2, is_deadly: false},
    %{power: 836.0, is_deadly: false},
    %{power: 2.5, is_deadly: false},
    %{power: 72000, is_deadly: true},
    %{power: 45000, is_deadly: true}
 ] 
end

test "a list of flares using list of comprehension", %{data: flares} do
  result = Solar.c_flare_list(flares)
  assert result == [
    %{power: 99000, is_deadly: true},
    %{power: 58.0, is_deadly: false},
    %{power: 12.0, is_deadly: false},
    %{power: 3.2, is_deadly: false},
    %{power: 836.0, is_deadly: false},
    %{power: 2.5, is_deadly: false},
    %{power: 72000, is_deadly: true},
    %{power: 45000, is_deadly: true}
 ] 
end

test "a list of flares using list of comprehension with 2 generators", %{data: flares} do
  result = Solar.c_f_flare_list(flares)
  assert result == [
    %{power: 99000, is_deadly: true},
    %{power: 58.0, is_deadly: false},
    %{power: 12.0, is_deadly: false},
    %{power: 3.2, is_deadly: false},
    %{power: 836.0, is_deadly: false},
    %{power: 2.5, is_deadly: false},
    %{power: 72000, is_deadly: true},
    %{power: 45000, is_deadly: true}
 ] 
end
end