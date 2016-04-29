defmodule Solar do
  
  def power(%{classification: :X, scale: scale}), do: 1000 * scale

  def power(%{classification: :M, scale: scale}), do: 10 * scale

  def power(%{classification: :C, scale: scale}), do: 1 * scale
  
  def no_eva(flares) do
    Enum.filter flares, &(power(&1) > 1000)   
  end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
    |> Enum.max
  end


  #Find total flare / total exposure in 4 ways: 1. Map, Sum 2. Recursion 3. Reduce 4. Comprehension
  
  # 1. Map & Sum
  def total_exposure(flares) do
    Enum.map(flares, &(power(&1)))
    |> Enum.sum
  end

  def sort_exposure(flares) do
    Enum.map(flares, &(power(&1)))
    |> Enum.sort
  end

  # 2. Recursion
  def r_total_exposure(flares) do
    r_total_exposure(flares, 0)    
  end

  def r_total_exposure([head | tail], total) do
    flare = power(head)
    r_total_exposure(tail, total + flare)   
  end

  def r_total_exposure([], total) do
    total
  end

  # 3. Reduce
  def reduce_total_exposure(flares) do
    Enum.reduce(flares, 0, fn(flare, total) -> power(flare) + total end)
  end

  # 4. Comprehension
  def c_total_exposure(flares) do
    (for flare <- flares, do: power(flare))
    |> Enum.sum
  end
end