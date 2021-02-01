defmodule FactorialReduce do
  def  factorialreduce(n) when is_integer(n), do: factorialreducep(n, 1, &(&1 * &2))
  defp factorialreducep(0, _, _), do: 0
  defp factorialreducep(1, acc, _), do: acc
  defp factorialreducep(n, acc, action) , do: factorialreducep(n-1, action.(n, acc), action )

end
IO.puts( FactorialReduce.factorialreduce(0))
IO.puts( FactorialReduce.factorialreduce(1))
IO.puts( FactorialReduce.factorialreduce(2))
IO.puts( FactorialReduce.factorialreduce(3))
IO.puts( FactorialReduce.factorialreduce(5))
IO.puts( FactorialReduce.factorialreduce(6))
IO.puts( FactorialReduce.factorialreduce(7))
#Si es viable ya que nos ayuda a reducir y optimizar código
