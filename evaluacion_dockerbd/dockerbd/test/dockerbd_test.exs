defmodule DockerbdTest do
  use ExUnit.Case
  doctest Dockerbd

  test "greets the world" do
    assert Dockerbd.hello() == :world
  end
end
