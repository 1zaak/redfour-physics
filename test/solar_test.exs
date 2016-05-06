defmodule SolarTest do
  # use ExUnit.Case, async: true
  use ExUnit.Case
  use Timex
  # import Solar.Flare
  doctest Solar.Flare

#   setup do
#     flares = [
#       %Solar.Flare{classification: :X, scale: 99, date: Timex.format!(Timex.date({1859, 8, 29}), "{YYYY}-{0M}-{D}")},
#       %Solar.Flare{classification: :M, scale: 5.8, date: Timex.format!(Timex.date({2015, 1, 12}), "{YYYY}-{0M}-{D}")},
#       %Solar.Flare{classification: :M, scale: 1.2, date: Timex.format!(Timex.date({2015, 2, 9}), "{YYYY}-{0M}-{D}")},
#       %Solar.Flare{classification: :C, scale: 3.2, date: Timex.format!(Timex.date({2015, 4, 18}), "{YYYY}-{0M}-{D}")},
#       %Solar.Flare{classification: :M, scale: 83.6, date: Timex.format!(Timex.date({2015, 6, 23}), "{YYYY}-{0M}-{D}")},
#       %Solar.Flare{classification: :C, scale: 2.5, date: Timex.format!(Timex.date({2015, 7, 4}), "{YYYY}-{0M}-{D}")},
#       %Solar.Flare{classification: :X, scale: 72, date: Timex.format!(Timex.date({2012, 7, 23}), "{YYYY}-{0M}-{D}")},
#       %Solar.Flare{classification: :X, scale: 45, date: Timex.format!(Timex.date({2003, 11, 4}), "{YYYY}-{0M}-{D}")}
#     ]
#     {:ok, data: flares}
#   end

#   test "8 solar flares", %{data: flares} do
#     assert length(flares) == 8
#   end

#   test "solar flare classfication X" do
#     assert power(%{classification: :X, scale: 99}) == 99000 
    
#   end

#   test "solar flare classfication M" do
#     assert power(%{classification: :M, scale: 99}) == 990
    
#   end

#    test "solar flare classfication C" do
#     assert power(%{classification: :C, scale: 99}) == 99
    
#   end

#   test "go inside", %{data: flares} do
#      d = no_eva(flares) 
#      assert length(d) == 3
     
#   end

#   test "max solar flare", %{data: flares} do
#     assert deadliest(flares) == 99000
#   end

#   test "total exposure", %{data: flares} do
#     assert total_exposure(flares) == 216911.7
#   end

#   test "sort exposure", %{data: flares} do
#     assert sort_exposure(flares) == [2.5, 3.2, 12, 58, 836, 45000, 72000, 99000]
#   end

#   test "total exposure (recursive)", %{data: flares} do
#     assert r_total_exposure(flares) == 216911.7
#   end

#   test "total exposure (reduce)", %{data: flares} do
#     assert reduce_total_exposure(flares) == 216911.7
#   end

#   test "total exposure (comprehension)", %{data: flares} do
#     assert c_total_exposure(flares) == 216911.7
#   end

#   test "flare power and deadliness", %{data: flares} do
#     assert flare_deadliness(flares) == [
#       power: 99000, is_deadly: true, 
#       power: 58.0, is_deadly: false, 
#       power: 12.0, is_deadly: false, 
#       power: 3.2, is_deadly: false,
#       power: 836.0, is_deadly: false, 
#       power: 2.5, is_deadly: false, 
#       power: 72000, is_deadly: true, 
#       power: 45000, is_deadly: true]
#   end

#   test "a list of flares using list of tuples", %{data: flares} do
#   result = flare_list(flares)
#   assert result == [
#     {:power, 99000, :is_deadly, true},
#     {:power, 58.0, :is_deadly, false},
#     {:power, 12.0, :is_deadly, false},
#     {:power, 3.2, :is_deadly, false},
#     {:power, 836.0, :is_deadly, false},
#     {:power, 2.5, :is_deadly, false},
#     {:power, 72000, :is_deadly, true},
#     {:power, 45000, :is_deadly, true}
#  ] 
# end

# test "a list of flares using list of tuples with label", %{data: flares} do
#   result = label_flare_list(flares)
#   assert result == [
#     {:flare, :power, 99000, :is_deadly, true},
#     {:flare, :power, 58.0, :is_deadly, false},
#     {:flare, :power, 12.0, :is_deadly, false},
#     {:flare, :power, 3.2, :is_deadly, false},
#     {:flare, :power, 836.0, :is_deadly, false},
#     {:flare, :power, 2.5, :is_deadly, false},
#     {:flare, :power, 72000, :is_deadly, true},
#     {:flare, :power, 45000, :is_deadly, true}
#  ] 
# end


#   test "a list of flares using list of maps", %{data: flares} do
#   result = maps_flare_list(flares)
#   assert result == [
#     %{power: 99000, is_deadly: true},
#     %{power: 58.0, is_deadly: false},
#     %{power: 12.0, is_deadly: false},
#     %{power: 3.2, is_deadly: false},
#     %{power: 836.0, is_deadly: false},
#     %{power: 2.5, is_deadly: false},
#     %{power: 72000, is_deadly: true},
#     %{power: 45000, is_deadly: true}
#  ] 
# end

# test "a list of flares using list of comprehension", %{data: flares} do
#   result = c_flare_list(flares)
#   assert result == [
#     %{power: 99000, is_deadly: true},
#     %{power: 58.0, is_deadly: false},
#     %{power: 12.0, is_deadly: false},
#     %{power: 3.2, is_deadly: false},
#     %{power: 836.0, is_deadly: false},
#     %{power: 2.5, is_deadly: false},
#     %{power: 72000, is_deadly: true},
#     %{power: 45000, is_deadly: true}
#  ] 
# end

# test "a list of flares using list of comprehension with 2 generators", %{data: flares} do
#   result = c_f_flare_list(flares)
#   assert result == [
#     %{power: 99000, is_deadly: true},
#     %{power: 58.0, is_deadly: false},
#     %{power: 12.0, is_deadly: false},
#     %{power: 3.2, is_deadly: false},
#     %{power: 836.0, is_deadly: false},
#     %{power: 2.5, is_deadly: false},
#     %{power: 72000, is_deadly: true},
#     %{power: 45000, is_deadly: true}
#  ] 
# end

# test "a solar flare is a map with a special key" do
#   %Solar.Flare{}.__struct__ 
# end

# test "load data into map", %{data: flares} do
#   assert load(flares) == [%Solar.Flare{classification: :X, date: "1859-08-29", is_deadly: true, power: 99000, scale: 99},
#             %Solar.Flare{classification: :M, date: "2015-01-12", is_deadly: false, power: 58.0, scale: 5.8},
#             %Solar.Flare{classification: :M, date: "2015-02-9", is_deadly: false, power: 12.0, scale: 1.2},
#             %Solar.Flare{classification: :C, date: "2015-04-18", is_deadly: false, power: 3.2, scale: 3.2},
#             %Solar.Flare{classification: :M, date: "2015-06-23", is_deadly: false, power: 836.0, scale: 83.6},
#             %Solar.Flare{classification: :C, date: "2015-07-4", is_deadly: false, power: 2.5, scale: 2.5},
#             %Solar.Flare{classification: :X, date: "2012-07-23", is_deadly: true, power: 72000, scale: 72},
#             %Solar.Flare{classification: :X, date: "2003-11-4", is_deadly: true, power: 45000, scale: 45}]
# end

# test "load data into map (comprehension)", %{data: flares} do
#   assert c_load(flares) == [%Solar.Flare{classification: :X, date: "1859-08-29", is_deadly: true, power: 99000, scale: 99},
#             %Solar.Flare{classification: :M, date: "2015-01-12", is_deadly: false, power: 58.0, scale: 5.8},
#             %Solar.Flare{classification: :M, date: "2015-02-9", is_deadly: false, power: 12.0, scale: 1.2},
#             %Solar.Flare{classification: :C, date: "2015-04-18", is_deadly: false, power: 3.2, scale: 3.2},
#             %Solar.Flare{classification: :M, date: "2015-06-23", is_deadly: false, power: 836.0, scale: 83.6},
#             %Solar.Flare{classification: :C, date: "2015-07-4", is_deadly: false, power: 2.5, scale: 2.5},
#             %Solar.Flare{classification: :X, date: "2012-07-23", is_deadly: true, power: 72000, scale: 72},
#             %Solar.Flare{classification: :X, date: "2003-11-4", is_deadly: true, power: 45000, scale: 45}]
# end

end