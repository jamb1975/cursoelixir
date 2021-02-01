defmodule IsAscendantReduce do
  def is_ascendantreduce?(list) when is_list(list), do: is_ascendantreducep?(list, nil)
  defp is_ascendantreducep?([], _), do: true
  defp is_ascendantreducep?([head | tail ], nil), do: is_ascendantreducep?([head | tail], head)
  defp is_ascendantreducep?([head | tail ], acc) when acc >= head, do: is_ascendantreducep?(tail, head)
  defp is_ascendantreducep?(_, _), do: false
end


IO.puts IsAscendantReduce.is_ascendantreduce?([])
IO.puts IsAscendantReduce.is_ascendantreduce?([7,2,1])
IO.puts IsAscendantReduce.is_ascendantreduce?([1])
IO.puts IsAscendantReduce.is_ascendantreduce?([3, 2, 7])
IO.puts IsAscendantReduce.is_ascendantreduce?([1, 2, 7, 9, 12])
IO.puts IsAscendantReduce.is_ascendantreduce?([12, 9, 7, 2, 1 ])
IO.puts IsAscendantReduce.is_ascendantreduce?([12, 9, 12, 1, 2 ])
# No es viable ya que no hay operaciones o formulas para aplicar
