defmodule SolarFlareRecorder do
  use GenServer

  # def handle_call(:load, _sender, state) do
    
  # end

  # def handle_cast({:new, flare}, state) do
  #   {:noreply, [flare | state]}
  # end

  def start_link do
    GenServer.start_link(__MODULE__, [])    
  end  

  def record(pid, flare) do
    GenServer.cast(pid, {:new, flare})
  end

  def current(pid) do
    GenServer.call(pid, :load)
  end

  def handle_call(:load, _sender, state) do
    {:reply, get_flares, []}
  end

  def handle_cast({:new, flare}, state) do
    add_flare(flare)
    {:noreply, []}
  end

  defp add_flare(flare) do
    """
      insert into solar_flares(index, classification, scale, date)
      values($1, $2, $3, now()) RETURNING *;
    """
    |> execute([flare.index, flare.classification, flare.scale])
  end

  defp get_flares do
    """
    select * from solar_flares;
    """
    |> execute
  end

  defp execute(sql, params \\ [])  do
    {:ok, pid} = connect

    res = Postgrex.query!(pid, sql, params) |> transform_result
    res
  end

  defp connect do
    Postgrex.start_link(hostname: "localhost", database: "redfour")
  end

  defp transform_result(result) do
    atomized = for col <- result.columns, do: String.to_atom(col)
    for row <- result.rows, do: List.zip([atomized, row]) |> Enum.into(%{})
  end
end