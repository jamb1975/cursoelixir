defmodule Fibonacci do
def fibonacci(n) when is_integer(n) and n >0, do: reduce(n, 0, 1, &(&1 + &2))
def reduce(n, a, b, action) when is_function(action, 2), do: reducep(n, a, b, action)
defp reducep(1, _, b, _), do: b
defp reducep(n, a, b, action) when n>0 , do: reducep(n-1, a+1, action.(a, b), action)

end

IO.puts Fibonacci.fibonacci(1)
IO.puts Fibonacci.fibonacci(2)
IO.puts Fibonacci.fibonacci(3)
IO.puts Fibonacci.fibonacci(4)
