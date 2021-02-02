defmodule IsDescendentReduce do
  def is_descendentreduce?(list \\ []) when is_list(list), do: reduce(list, nil, nil)

  def reduce(list, acc, action), do:  reducep(list, acc, action)
  def reducep([], _, _), do: true
  def reducep([head | tail ], acc, action) when acc >= head,  do: reducep(tail, head, action)
  def reducep(_, _, _), do: false
end

IO.puts IsDescendentReduce.is_descendentreduce?()
IO.puts IsDescendentReduce.is_descendentreduce?([])
IO.puts IsDescendentReduce.is_descendentreduce?([7,2,1])
IO.puts IsDescendentReduce.is_descendentreduce?([1])
IO.puts IsDescendentReduce.is_descendentreduce?([3, 2, 7])
IO.puts IsDescendentReduce.is_descendentreduce?([1, 2, 7, 9, 12])
IO.puts IsDescendentReduce.is_descendentreduce?([12, 9, 7, 2, 1 ])
IO.puts IsDescendentReduce.is_descendentreduce?([12, 9, 12, 1, 2 ])
# No es viable ya que no hay operaciones o formulas para aplicar
