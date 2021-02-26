defmodule CommandTest do
  use ExUnit.Case
  doctest KVServer.Command

  test "running command" do
    #KVServer.Supervisor.start_link(__MODULE__, :ok, opts)
    {:ok, supid} = KVServer.Command.run(:create)

    assert {:ok, "0\r\n"} == KVServer.Command.run(:read)

    assert {:ok, "ok\r\n"} == KVServer.Command.run({:increment, 70})
    assert {:ok, "70\r\n"} == KVServer.Command.run(:read)

    assert {:ok,  "ok\r\n"} == KVServer.Command.run({:decrement, 30})
    assert {:ok, "40\r\n"} == KVServer.Command.run(:read)

    assert {:ok, "ok\r\n"} == KVServer.Command.run({:decrement, 40})
    assert {:ok,  "0\r\n"} == KVServer.Command.run(:read)
  end

  test "running unknown command" do
    #KVServer.Supervisor.start_link(__MODULE__, :ok, opts)
    {:ok, supid} = KVServer.Command.run(:create)
    assert  {:ok, "UNKNOWN COMMAND\r\n"} ==  KVServer.Command.run({:invalid, 70})
  end

  test "running COMMAND parse" do
    {:ok, _} = KVServer.Command.run(:create)
    assert {:ok, :create} == KVServer.Command.parse("C")
    assert {:ok, :read} == KVServer.Command.parse("R")

    assert {:ok, {:increment, 7}} ==  KVServer.Command.parse("I 7")
    assert {:ok, {:decrement, 10}} ==  KVServer.Command.parse("D 10")

    assert {:error, :unknown_command} ==  KVServer.Command.parse("ERR")
    assert {:ok, nil} ==  KVServer.Command.parse("_")
    assert {:ok, nil} ==  KVServer.Command.parse("_ssss")
    assert {:ok, nil} ==  KVServer.Command.parse("")
    assert {:ok, nil} ==  KVServer.Command.parse("I 7 8")
    assert {:ok, nil} ==  KVServer.Command.parse("D 7 8")
    assert {:ok, nil} ==  KVServer.Command.parse("////")
  end
end
