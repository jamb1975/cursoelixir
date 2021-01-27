defmodule Fibo do
def fib(n) do
  cond do

      n>1->fib(n-1)+fib(n-2)
      n==1->1
      n==0->0
      true->-1
    end
    end
  end

  defmodule MostrarSeries do
    def ms(s) do
      cond do
        s>=1->MostrarSeries.ms(s+1)
              IO.puts Fibo.ms(s)
         s==20->-1
        true->-1
      end
      end
    end
   IO.inspect  [Fibo.fib(0),Fibo.fib(1),Fibo.fib(2),Fibo.fib(3),Fibo.fib(4),Fibo.fib(5),Fibo.fib(6),Fibo.fib(7),Fibo.fib(8),Fibo.fib(9)]
