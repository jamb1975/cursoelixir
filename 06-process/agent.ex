# a agent tiene un start link tiene una funcion anonima y tiene un mapa que esta vacio{00000}
{: ok, pid} = Agent.start_link(fn ->%{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, "World") end)
Agent.get(pid, fn map -> Map.put(map, :hello) end)
