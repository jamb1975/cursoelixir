defmodule MongopruebaTest do
  use ExUnit.Case
  doctest Mongoprueba

  test "greets the world" do
    assert Mongoprueba.hello() == :world
  end
end
