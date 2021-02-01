defmodule IsAscendant do
  def is_ascendant?(list) when is_list(list), do: is_ascendantp?(list, nil)
  defp is_ascendantp?([], _), do: true
  defp is_ascendantp?([head | tail ], nil), do: is_ascendantp?([head | tail], head)
  defp is_ascendantp?([head | tail ], acc) when acc >= head, do: is_ascendantp?(tail, head)
  defp is_ascendantp?(_, _), do: false
end


IO.puts IsAscendant.is_ascendant?([])
IO.puts IsAscendant.is_ascendant?([7,2,1])
IO.puts IsAscendant.is_ascendant?([1])
IO.puts IsAscendant.is_ascendant?([3, 2, 7])
IO.puts IsAscendant.is_ascendant?([1, 2, 7, 9, 12])
IO.puts IsAscendant.is_ascendant?([12, 9, 7, 2, 1 ])
IO.puts IsAscendant.is_ascendant?([12, 9, 12, 1, 2 ])
