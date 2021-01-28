defmodule Fibonacci do
def classic(n) when is_integer(n) and n>0 do
  #cond do
    #n=0=1 -> 1# si es uno el proceso termina en 1
  #  true->
    fibonaccip(n) # call function privada facp1
  # end
end
defp   fibonaccip(n)  do
  #IO.puts "#{n-1} + #{n-2}=#{(n-1)+(n-2)}"
  cond do
    n==0  -> 0
    n==1-> 1
    true-> fibonaccip(n-1) + fibonaccip(n-2)
  end
end
end
IO.puts Fibonacci.classic(10)
