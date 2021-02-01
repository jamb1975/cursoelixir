defmodule IsDescendentReduce do
  def is_descendentreduce?(list) when is_list(list), do: is_descendentreducep?(list, nil)
  defp is_descendentreducep?([], _), do: true
  defp is_descendentreducep?([head | tail ], nil), do: is_descendentreducep?([head | tail], head)
  defp is_descendentreducep?([head | tail ], acc) when acc >= head, do: is_descendentreducep?(tail, head)
  defp is_descendentreducep?(_, _), do: false
end


IO.puts IsDescendentReduce.is_descendentreduce?([])
IO.puts IsDescendentReduce.is_descendentreduce?([7,2,1])
IO.puts IsDescendentReduce.is_descendentreduce?([1])
IO.puts IsDescendentReduce.is_descendentreduce?([3, 2, 7])
IO.puts IsDescendentReduce.is_descendentreduce?([1, 2, 7, 9, 12])
IO.puts IsDescendentReduce.is_descendentreduce?([12, 9, 7, 2, 1 ])
IO.puts IsDescendentReduce.is_descendentreduce?([12, 9, 12, 1, 2 ])
# No es viable ya que no hay operaciones o formulas para aplicar
