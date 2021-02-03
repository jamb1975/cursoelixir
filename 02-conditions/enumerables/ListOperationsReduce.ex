defmodule ListOperationsReduce do
  def sumreduce(list) when is_list(list), do: sumreducep(list, 0, &(&1 + &2))
  defp sumreducep([], acc, _), do: acc
  defp sumreducep([h | t], acc, action) when is_function(action, 2), do: sumreducep(t, action.(h, acc), action )

  def reversereduce(list2) when is_list(list2), do: reversereducep(list2, [], &(&1 ++ &2))
  defp reversereducep([], reverselist, _), do: reverselist
  defp reversereducep([h | t], reverselist, action2) when is_function(action2, 2), do: reversereducep(t, action2.([h], reverselist), action2)

  def is_ascendant?(list) when is_list(list),  do: is_ascendantp?(list, nil)
  defp is_ascendantp?([],  _), do: true
  defp is_ascendantp?([h | t],  nil), do: is_ascendantp?(t, h)
  defp is_ascendantp?([h | t], acc) when acc <= h  , do: is_ascendantp?(h, t)
  defp is_ascendantp?(_, _), do: false
end
IO.puts "=======ListOperationsReduce.sumreduce========="
IO.puts ListOperationsReduce.sumreduce([])
IO.puts ListOperationsReduce.sumreduce([1])
IO.puts ListOperationsReduce.sumreduce([2, 5, 7])
IO.puts ListOperationsReduce.sumreduce([5, 2, 7])

IO.puts "=======ListOperationsReduce.reversereduce========="
IO.inspect ListOperationsReduce.reversereduce([])
IO.inspect ListOperationsReduce.reversereduce([1])
IO.inspect ListOperationsReduce.reversereduce([5, 2, 7])

IO.puts "=======ListOperationsReduce.is_ascendant?========="
IO.inspect ListOperationsReduce.is_ascendant?([])
IO.inspect ListOperationsReduce.is_ascendant?([1])
IO.inspect ListOperationsReduce.is_ascendant?([5, 2, 7])
IO.inspect ListOperationsReduce.is_ascendant?([2, 5, 7])
