defmodule SumaArrayReduce do
  def sumaarrayreduce(list) when is_list(list), do: sumaarrayreducep(list, [], 0, &(&1 ++ &2 ), &(&1 + &2))
  def sumaarrayreducep([], resultarray, _, _, _), do: resultarray
  def sumaarrayreducep([h | t], resultarray, acc, action, sumar) when is_function(action, 2) and is_function(sumar,2), do: sumaarrayreducep(t, action.(resultarray, [sumar.(acc, h)]), sumar.(acc, h), action, sumar)
end

IO.inspect SumaArrayReduce.sumaarrayreduce([])
IO.inspect SumaArrayReduce.sumaarrayreduce([1, 3, 4, -1])
