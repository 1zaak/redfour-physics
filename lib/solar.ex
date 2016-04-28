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
end