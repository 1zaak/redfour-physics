defmodule OtpTest do
  use ExUnit.Case

  # test "a simple process" do
  #   res = for n <- 1..100000, do: spawn(fn() -> IO.inspect "HI" end) 
  # end

  setup do
  {:ok, pid} = Postgrex.start_link(hostname: "localhost", database: "redfour")  
  Postgrex.query!(pid, "delete from solar_flares", [])
  IO.puts "Setup otp_test running"
  end

  test "simple run" do
    IO.puts "otp_test running"
  end

  # test "inserting 100 flares asyncronously" do
  #   res = Enum.map 1..10, fn(n) ->
  #     {:ok, pid} = SolarFlareRecorder.start_link()     
  #     SolarFlareRecorder.record(pid, %{index: n, classification: "M", scale: 22})
  #   end 
  #   :timer.sleep(1000)    
  #   assert Helpers.check_flare_count == 10
  # end

  test "using worker to run 10 recorders concurrently" do
    res = Enum.map 1..11, fn(n) ->
      spawn(SolarFlareWorker, :run, [9])
    end
    :timer.sleep(1000)
    assert Helpers.check_flare_count == 200
  end

end