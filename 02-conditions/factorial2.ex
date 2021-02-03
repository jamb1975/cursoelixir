defmodule Factorial2 do
  def classic(n) when is_integer(n) and n>=0 do
       cond do
        n < 2 -> 1
        true->fac2(n)
      end
    end

    def fac2(n) when is_integer(n) and n >=0 do
      cond do
        n < 1 -> 1
        true->facp2(n-1, n)
      end
    end

    defp facp2(0,acc) when is_integer(acc) do
      acc
    end
    defp facp2(n,acc) when is_integer(n) do
      facp2(n-1, acc * n)
    end
  end


IO.puts Factorial2.classic(6)
IO.puts("fac(0) =#{Factorial2.fac2(0)}")
IO.puts("fac(1) =#{Factorial2.fac2(1)}")
IO.puts("fac(2) =#{Factorial2.fac2(2)}")
IO.puts("fac(3) =#{Factorial2.fac2(3)}")
IO.puts("fac(4) =#{Factorial2.fac2(4)}")
IO.puts("fac(5) =#{Factorial2.fac2(5)}")
