defmodule KVServer do
  defmodule KV do
    @moduledoc """
    Provides a key-vale (KV) process to access a shared state map based on agent
    ## Examples
    iex> {:ok, kv} = KV.start_link()
    {ok:, #PID<0.101.0>}
    iex> KV.read(kv, :hello)
    nil
    iex> KV.update(kv, :hello, "World)
    :ok
    iex> KV.read(kv, :hello)
    "World"
    """
  @vsn 2
  @initial_state %{hello: "Mundo"}
    @doc """
       Create a pid to read and create/update key-value pair
  
       ##Example
        iex> {:ok, kv} = KV.start_link()
        {ok:, #PID<0.101.0>}
    """
    def start_link do
      Agent.start_link(fn -> @initial_state end)
    end
  
  
     @doc """
       read a value for a key, if the key if does not exists return null
  
       ##Example
        iex> KV.read(kv, :hello)
        nil
    """
    def read(kv_pid, key) do
       Agent.get(kv_pid, fn map -> Map.get(map, key) end)
    end
  
    @doc """
       updates or creates (if necessary) a value a key
       ##Example
        iex> KV.update(kv, :hello, "World)
        :ok
    """
    def update(kv_pid, key, value) do
      Agent.update(kv_pid, fn map -> Map.put(map, key, value) end)
    end
 
    def hello do
     :world
   end
end
