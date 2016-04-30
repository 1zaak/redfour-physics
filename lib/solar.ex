defmodule Solar do
  @moduledoc """
  1. Find total flare / total exposure in 4 ways: 1. Map, Sum 2. Recursion 3. Reduce 4. Comprehension
  """


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


  
  @doc """
  1. Map & Sum
  """
  def total_exposure(flares) do
    Enum.map(flares, &(power(&1)))
    |> Enum.sum
  end

  @doc """
  Sort flares by power ascending
  """
  def sort_exposure(flares) do
    Enum.map(flares, &(power(&1)))
    |> Enum.sort
  end

  @doc """
  2. Recursion
  """
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

  @doc """
  3. Reduce
  """
  def reduce_total_exposure(flares) do
    Enum.reduce(flares, 0, fn(flare, total) -> power(flare) + total end)
  end

  @doc """
  4. Comprehension
  """
  def c_total_exposure(flares) do
    (for flare <- flares, do: power(flare))
    |> Enum.sum
  end

  @doc """
  Calculate flare power and deadliness
  """
  def flare_deadliness(flares) do
    Enum.map(flares, fn(flare) -> 
      [power: power(flare), is_deadly: power(flare) > 1000] end)
      |> List.flatten
  end

  @doc """
  Calculate flare power and deadliness (tuple)
  """
  def flare_list(flares) do
    Enum.map flares, fn(flare) -> 
      p = power(flare)
      {:power, p, :is_deadly, p > 1000} end
  end

   @doc """
  Calculate flare power and deadliness (tuple with label)
  """
  def label_flare_list(flares) do
    Enum.map flares, fn(flare) -> 
      p = power(flare)
      {:flare, :power, p, :is_deadly, p > 1000} end
  end

   @doc """
  Calculate flare power and deadliness (maps)
  """
  def maps_flare_list(flares) do
    Enum.map flares, fn(flare) -> 
      p = power(flare)
      %{power: p, is_deadly: p > 1000} end
  end

  @doc """
  Calculate flare power and deadliness (comprehension)
  """
  def c_flare_list(flares) do
    for flare <- flares, do: %{power: power(flare), is_deadly: power(flare) > 1000}
  end

  @doc """
  Calculate flare power and deadliness (comprehension with 2 filters)
  """
  def c_f_flare_list(flares) do
    for flare <- flares, power <- [power(flare)], is_deadly <- [power > 1000], do: %{power: power, is_deadly: is_deadly}
  end
end