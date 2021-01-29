defmodule Fibonacci do
def fibonacci(n) when is_integer(n) and n >0 do
  fibonacci(n,0, 1)
end
defp fibonaccip(1, a, b), do: b
defp fibonaccip(1, a, b), do: fibonacci(n - 1,b, a + b)
end

IO.puts Fibonacci.fibonacci(1)
IO.puts Fibonacci.fibonacci(2)
IO.puts Fibonacci.fibonacci(3)
IO.puts Fibonacci.fibonacci(4)
