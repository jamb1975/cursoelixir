defmodule FactorialReduce do
  def  reduce(n \\ 0) when is_integer(n), do: reducep(n, 1, &(&1 * &2))
  defp reducep(0, _, _), do: 0
  defp reducep(1, acc, _), do: acc
  defp reducep(n, acc, action) , do: reducep(n-1, action.(n, acc), action )


end
IO.puts( FactorialReduce.reduce())
IO.puts( FactorialReduce.reduce(0))
IO.puts( FactorialReduce.reduce(1))
IO.puts( FactorialReduce.reduce(2))
IO.puts( FactorialReduce.reduce(3))
IO.puts( FactorialReduce.reduce(5))
IO.puts( FactorialReduce.reduce(6))
IO.puts( FactorialReduce.reduce(7))
#no es viable ya que  se utilizan mas pasos
# forzan la solución
