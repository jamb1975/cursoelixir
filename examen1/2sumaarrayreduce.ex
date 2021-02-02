defmodule SumaArray do
  def sumaarray(list \\ []) when is_list(list), do: reduce(list, [], 0, &(&1 + &2))


  def reduce(list, resultarray, acc, sum) when is_function(sum,2), do:  reducep(list, resultarray, acc, sum)
  def reducep([], resultarray, _, _), do: resultarray
  def reducep([h | t],  resultarray, acc, sum),  do: reducep(t, resultarray ++ [sum.(acc, h)],sum.(acc, h), sum)

end
IO.inspect SumaArray.sumaarray()
IO.inspect SumaArray.sumaarray([])
IO.inspect SumaArray.sumaarray([1])
IO.inspect SumaArray.sumaarray([1, 2])
IO.inspect SumaArray.sumaarray([1, 3, 4, -1])
