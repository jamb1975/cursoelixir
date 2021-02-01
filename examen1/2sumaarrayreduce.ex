defmodule SumaArrayReduce do
  def sumaarrayreduce(list) when is_list(list), do: sumaarrayreducep(list, [], 0, &(&1 ++ &2 ))
  def sumaarrayreducep([], resultarray, _, _), do: resultarray
  def sumaarrayreducep([h | t], resultarray, acc, action) when is_function(action, 2), do: sumaarrayreducep(t, action.(resultarray, [acc + h]), acc + h, action)
end

IO.inspect SumaArrayReduce.sumaarrayreduce([])
IO.inspect SumaArrayReduce.sumaarrayreduce([1, 3, 4, -1])
