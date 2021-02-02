defmodule IsDescendent do
  def is_descendent?(list \\ []) when is_list(list), do: is_descendentp?(list, nil)
  defp is_descendentp?([], _), do: true
  defp is_descendentp?([head | tail ], nil), do: is_descendentp?([head | tail], head)
  defp is_descendentp?([head | tail ], acc) when acc >= head, do: is_descendentp?(tail, head)
  defp is_descendentp?(_, _), do: false
end

IO.puts IsDescendent.is_descendent?()
IO.puts IsDescendent.is_descendent?([])
IO.puts IsDescendent.is_descendent?([7,2,1])
IO.puts IsDescendent.is_descendent?([1])
IO.puts IsDescendent.is_descendent?([3, 2, 7])
IO.puts IsDescendent.is_descendent?([1, 2, 7, 9, 12])
IO.puts IsDescendent.is_descendent?([12, 9, 7, 2, 1 ])
IO.puts IsDescendent.is_descendent?([12, 9, 12, 1, 2 ])
