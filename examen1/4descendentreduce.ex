defmodule IsDescendentReduce do
  def is_descendentreduce?(list \\ []) when is_list(list), do: reduce(list, nil, nil)

  def is_descendentreduce?(list \\ []) when is_list(list) do
    {result, _} =reduce(list,{true, nil}, fn  h, {condition, min} ->
    cond do
     !condition -> {false, }
    end)
    result
end

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
    reducep(list, acc, action)
  end
  #defp mapp([], acc, _), do: acc
  #defp mapp([h | t], acc, transform), do: mapp(t, acc ++[transform.(h)], transform)
  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)


IO.puts IsDescendentReduce.is_descendentreduce?()
IO.puts IsDescendentReduce.is_descendentreduce?([])
IO.puts IsDescendentReduce.is_descendentre duce?([7,2,1])
IO.puts IsDescendentReduce.is_descendentreduce?([1])
IO.puts IsDescendentReduce.is_descendentreduce?([3, 2, 7])
IO.puts IsDescendentReduce.is_descendentreduce?([1, 2, 7, 9, 12])
IO.puts IsDescendentReduce.is_descendentreduce?([12, 9, 7, 2, 1 ])
IO.puts IsDescendentReduce.is_descendentreduce?([12, 9, 12, 1, 2 ])
# No es viable ya que no hay operaciones o formulas para aplicar
