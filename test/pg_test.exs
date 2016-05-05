defmodule PgTest do
  use ExUnit.Case
  use Timex

  setup do
  flares =  [
     %Solar.Flare{classification: :X, scale: 99, date: Timex.date({1859, 8, 29})},
      %Solar.Flare{classification: :M, scale: 5.8, date: Timex.date({2015, 1, 12})},
      %Solar.Flare{classification: :M, scale: 1.2, date: Timex.date({2015, 2, 9})},
      %Solar.Flare{classification: :C, scale: 3.2, date: Timex.date({2015, 4, 18})},
      %Solar.Flare{classification: :M, scale: 83.6, date: Timex.date({2015, 6, 23})},
      %Solar.Flare{classification: :C, scale: 2.5, date: Timex.date({2015, 7, 4})},
      %Solar.Flare{classification: :X, scale: 72, date: Timex.date({2012, 7, 23})},
      %Solar.Flare{classification: :X, scale: 45, date: Timex.date({2003, 11, 4})}
  ]

  {:ok, data: flares}
end

  # test "Connecting with Postgrex", %{data: flares} do
  #   {:ok, pid} = Postgrex.start_link(hostname: "localhost", database: "redfour")

  #   sql = """
  #   insert into solar_flares(classification, scale, date)
  #   values($1, $2, $3)
  #   """

    
  #   res = Enum.map flares, fn(flare) -> 
  #   ts = %Postgrex.Timestamp{year: flare.date.year, month: flare.date.month, day: flare.date.day}
  #   Postgrex.query!(pid, sql, [Atom.to_string(flare.classification), flare.scale, ts])
  #   end
    
  #   IO.inspect res
    
  # end

  test "Querying Postgrex", %{data: flares} do
    {:ok, pid} = Postgrex.start_link(hostname: "localhost", database: "redfour")
    sql = """
     select * from solar_flares
    """
    res = Postgrex.query!(pid, sql, []) |> transform_result
    IO.inspect res    
  end

   def transform_result(result) do
     for row <- result.rows, do: List.zip([result.columns, row])
   end

   def transform_result(result) do
  atomized = for col <- result.columns, do: String.to_atom(col)
  for row <- result.rows, do: final = List.zip([atomized, row]) |> Enum.into(%{})
end
    
end