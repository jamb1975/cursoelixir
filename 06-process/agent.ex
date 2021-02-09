# a agent tiene un start link tiene una funcion anonima y tiene un mapa que esta vacio{00000}
{: ok, pid} = Agent.start_link(fn ->%{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, "World") end)
Agent.get(pid, fn map -> Map.put(map, :hello) end)
{:ok, agent} = Agent.start_link fn ->[] end
Agent.update(agent, fn -> ["hello" | list] end)
Agent.get(agent, fn list -> list  end)
{:ok, agent} = Agent.start_link fn ->123 end
Agent.get_and_update(agent, fn state ->{state - 5, state -1} end)
Agent.get(agent, fn x -> x end)
