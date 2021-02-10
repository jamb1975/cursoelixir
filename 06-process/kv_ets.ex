    defmodule Ets do

    @vsn 2
    def start_link do
      fn -> :ets.new(:my_bucket, [:set, :protected]) end
    end

    def insert(table, key, value) do
      :ets.insert(table, {key, value})
    end

    def read(table, key) do
      :ets.lookup(table, "bar")
    end

    def update(table, key, value) do
      :ets.insert(table, {key, value})
    end
  end

    table = Ets.start_link()
    value = Ets.read(table, "bar")
    IO.inspect value
