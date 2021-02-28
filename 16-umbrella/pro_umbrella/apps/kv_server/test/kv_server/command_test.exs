defmodule CommandTest do
  use ExUnit.Case
  doctest KVServer.Command

  test "running unknown command" do
    #KVServer.Supervisor.start_link(__MODULE__, :ok, opts)
    {:ok, _} = KVServer.Command.run(:create)
    assert  {:ok, "UNKNOWN COMMAND\r\n"} ==  KVServer.Command.run({:invalid, 70})
    assert  {:ok, "UNKNOWN COMMAND\r\n"} ==  KVServer.Command.run({:invalid, ""})
  end

  test "running command" do
    #KVServer.Supervisor.start_link(__MODULE__, :ok, opts)
    {:ok, _} = KVServer.Command.run(:create)

    assert {:ok, "0\r\n"} == KVServer.Command.run(:read)

    assert {:ok, "ok\r\n"} == KVServer.Command.run({:increment, 70})
    assert {:ok, "70\r\n"} == KVServer.Command.run(:read)

    assert {:ok,  "ok\r\n"} == KVServer.Command.run({:decrement, 30})
    assert {:ok, "40\r\n"} == KVServer.Command.run(:read)

    assert {:ok, "ok\r\n"} == KVServer.Command.run({:decrement, 40})
    assert {:ok,  "0\r\n"} == KVServer.Command.run(:read)
  end

  test "Test error parse" do
    GenServerObserver.reset(GenServerObserver)
    assert {:error, :invalid} ==  KVServer.Command.parse("_")
    assert {:error, :invalid} ==  KVServer.Command.parse("_ssss")

    assert {:error, :invalid} ==  KVServer.Command.parse("")
    assert {:error, :invalid} ==  KVServer.Command.parse("I 78")
    assert {:error, :invalid} ==  KVServer.Command.parse("D 7 8")
    assert {:error, :invalid} ==  KVServer.Command.parse("////")
    assert {:error, :unknown_command} ==  KVServer.Command.parse("ERR")
  end

  test "running COMMAND parse" do
    {:ok, _} = KVServer.Command.run(:create)
    assert {:ok, :create} == KVServer.Command.parse("C")
    assert {:ok, :read} == KVServer.Command.parse("R")

    assert {:ok, {:increment, 7}} ==  KVServer.Command.parse("I 7")
    assert {:ok, {:decrement, 10}} ==  KVServer.Command.parse("D 10")
  end
end
