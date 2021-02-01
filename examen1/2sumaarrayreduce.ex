defmodule SumaArrayReduce do
  def sumaarrayreduce(list) when is_list(list), do: sumaarrayreducep(list, [], 0, &(&1 ++ &2 ))
  def sumaarrayreducep([], resultarray, _, _), do: resultarray
  def sumaarrayreducep([h | t], resultarray, acc, concatearray) when is_function(concatearray, 2), do: sumaarrayreducep(t, concatearray.(resultarray, [acc + h]), acc + h, concatearray)
end

IO.inspect SumaArrayReduce.sumaarrayreduce([])
IO.inspect SumaArrayReduce.sumaarrayreduce([1])
IO.inspect SumaArrayReduce.sumaarrayreduce([1, 2])
IO.inspect SumaArrayReduce.sumaarrayreduce([1, 3, 4, -1])
