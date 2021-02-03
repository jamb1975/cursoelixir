defmodule SumaArray do



  def sumaarray(list \\ []) when is_list(list) do
    {_, result} =reduce(list,{0, []}, fn  h, acc ->
    {newacc, resultarray} = acc
    newacc=newacc + h
    resultarray= resultarray ++ [newacc]
    {newacc, resultarray}
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

end
IO.inspect SumaArray.sumaarray()
IO.inspect SumaArray.sumaarray([])
IO.inspect SumaArray.sumaarray([1])
IO.inspect SumaArray.sumaarray([1, 2])
IO.inspect SumaArray.sumaarray([1, 3, 4, -1])
