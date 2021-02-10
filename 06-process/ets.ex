    defmodule Ets do

    def start_link do
       table = :ets.new(:my_bucket, [:set, :protected])
       :ets.insert(table,{"bar", self()})
       table
    end

    def insert(table, key, value), do: :ets.insert(table, {key, value})
    def read(table, key) do
      recordList = :ets.lookup(table, key)
      for {k, v} <- recordList, into: %{}, do: {k, v}
    end
    def update(table, key, value), do: :ets.insert(table, {key, value})
  end

   table = Ets.start_link()
   IO.inspect table
   record = Ets.read(table, "bar")
   IO.inspect record["bar"]
   Ets.update(table, "bar", 7)
   record = Ets.read(table, "bar")
   IO.inspect record["bar"]
