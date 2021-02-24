defmodule GENServerTest do
  use ExUnit.Case
  doctest GENServer

  test "greets the world" do
    assert GENServer.hello() == :world
  end
end
