defmodule ObserverGenServerTest do
  use ExUnit.Case
  doctest ObservableGenServer
  test "Observable utilizando GenServer increment y decrement" do
    subject = ObservableGenServer.create()
    ObservableGenServer.increment(subject)
    assert_receive 1
    assert ObservableGenServer.await() == :timeout
    ObservableGenServer.attach(subject)
    ObservableGenServer.increment(subject)

    assert_receive 2
    ObservableGenServer.detach(subject)
    ObservableGenServer.increment(subject)
    assert_receive 2
    assert ObservableGenServer.await() == :timeout
  end
end
