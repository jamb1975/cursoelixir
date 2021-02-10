defmodule ObserverGenServerTest do
  use ExUnit.Case
  doctest ObservableGenServer
  test "Observable utilizando attatch GenServer increment y decrement" do
    {:ok, subject} = ObservableGenServer.create(0)
    ObservableGenServer.increment(subject)
    assert ObservableGenServer.await() == :timeout
    ObservableGenServer.attach(subject)
    ObservableGenServer.increment(subject)
    assert ObservableGenServer.await() == 2
    ObservableGenServer.decrement(subject)
    assert ObservableGenServer.await() == 1
  end

  test "Observable utilizando attach detach | GenServer increment y decrement" do
    {:ok, subject} = ObservableGenServer.create(7)
    ObservableGenServer.attach(subject)
    ObservableGenServer.increment(subject)
    assert ObservableGenServer.await() == 8
    ObservableGenServer.increment(subject)
    assert ObservableGenServer.await() == 9
    ObservableGenServer.detach(subject)
    ObservableGenServer.decrement(subject)
    assert ObservableGenServer.await() == :timeout
    ObservableGenServer.attach(subject)
    ObservableGenServer.decrement(subject)
    assert ObservableGenServer.await() == 7
  end
end
