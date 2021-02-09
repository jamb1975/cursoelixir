defmodule Fibonacci do
  @spec fibonacci(integer()) :: integer()
  def fibonacci(n \\ 1) when is_integer(n) and n > 0, do: fibonacci(n, 0, 1, &(&1 + &2))
  def fibonacci(n, a, b, action) when is_function(action, 2), do: fibonaccip(n, a, b, action)
  defp fibonaccip(1, _, b, _), do: b
  defp fibonaccip(n, a, b, action), do: fibonaccip(n-1, b, action.(a, b), action)
 end
IO.puts Fibonacci.fibonacci()
IO.puts Fibonacci.fibonacci(1)
IO.puts Fibonacci.fibonacci(2)
IO.puts Fibonacci.fibonacci(3)
IO.puts Fibonacci.fibonacci(10)
IO.puts Fibonacci.fibonacci(2.0)
#Si es viable ya que nos ayuda a reducir y optimizar código
