defmodule MyMapReduce do

def double(list) when is_list(list), do: map(list, &(2* &1))
def sum(list) when is_list(list), do: reduce(list, 0, &(&1 + &2))

defp doublep([], acc), do: acc
defp doublep([h | t], acc), do: doublep(t, acc ++ [2 * h])

def map(list, transform) when is_list(list) and is_function(transform, 1) do
  #mapp(list, [], transform)
  reduce(list, [], fn h, acc-> ++ [transform.(h)] end)
end
def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
  reducep(list, acc, action)
end
#defp mapp([], acc, _), do: acc
#defp mapp([h | t], acc, transform), do: mapp(t, acc ++[transform.(h)], transform)
defp reducep([], acc, _), do: acc
defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc)], action)

end
