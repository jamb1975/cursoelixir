defmodule SumaArray do
  def sumaarray(list \\ []) when is_list(list), do: sumaarrayp(list, [], 0)
  defp sumaarrayp( [], resultarray, _), do: resultarray
  defp sumaarrayp([h | t] , resultarray, acc), do: sumaarrayp(t, resultarray ++ [acc + h], acc + h)
end
IO.inspect SumaArray.sumaarray()
IO.inspect SumaArray.sumaarray([])
IO.inspect SumaArray.sumaarray([1])
IO.inspect SumaArray.sumaarray([1, -2])
IO.inspect SumaArray.sumaarray([1, 3, 4, -1])
IO.inspect SumaArray.sumaarray([1, 3, 4, 7])
