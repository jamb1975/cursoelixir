defmodule Fibonacci do
def classic(n) when is_integer(n) and n>0 do
  #cond do
    #n=0=1 -> 1# si es uno el proceso termina en 1
  #  true->
    fibonaccip(n) # call function privada facp1
  # end
end
defp   fibonaccip(n)  do
 # IO.puts "Fibo acum: #{n}"
  cond do
    n==0  -> 0
    n==1-> 1
    true-> fibonaccip(n-1) + fibonaccip(n-2)
  end
end
end
IO.puts Fibonacci.classic(3)
IO.inspect  [Fibonacci.classic(0),Fibonacci.classic(1),Fibonacci.classic(2),Fibonacci.classic(3),Fibonacci.classic(4),Fibonacci.classic(5),Fibonacci.classic(6),Fibonacci.classic(7),Fibonacci.classic(8),Fibonacci.classic(9)]
