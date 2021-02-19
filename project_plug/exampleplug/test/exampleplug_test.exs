defmodule ExampleplugTest do
  use ExUnit.Case
  doctest Exampleplug

  test "greets the world" do
    assert Exampleplug.hello() == :world
  end
end
