defmodule OtpTest do
  use ExUnit.Case

  # test "a simple process" do
  #   res = for n <- 1..100000, do: spawn(fn() -> IO.inspect "HI" end) 
  # end

  test "a simple service" do
    {:ok, pid} = SolarFlareRecorder.start_link()
    SolarFlareRecorder.record(pid, %{classification: :M, scale: 22})
    SolarFlareRecorder.record(pid, %{classification: :X, scale: 33})
    res = SolarFlareRecorder.current(pid)
    IO.inspect res
  end
end