#defmodule Factorial do
 # def fac(n) do
 #   cond do

 #       n>1->n * fac(n-1)
  #      n>=0->1
  #      true->1 #Needed when the rest of cases are false
  #    end
  #  end
 # end

  defmodule Factorial do
    def classic(n) when is_integer(n) and n>=0 do
      cond do
          n < 2 -> 1
          true->fac1(n)
        end
      end
      def fac1(n) do
        facp1(n,0,1)
      end
      #defp facp1(0,acc) when is_integer(acc) do
      #  acc
      #end
      defp facp1(n,i,acc) when is_integer(n) do
        cond do
          i==n->acc
          true-> facp1(n, i+1,acc * (i+1))
        end
      end
    end


    IO.puts Factorial.classic(6)
    IO.puts("fac(0) =#{Factorial.fac1(0)}")
    IO.puts("fac(1) =#{Factorial.fac1(1)}")
    IO.puts("fac(2) =#{Factorial.fac1(2)}")
    IO.puts("fac(3) =#{Factorial.fac1(3)}")
    IO.puts("fac(4) =#{Factorial.fac1(4)}")
    IO.puts("fac(5) =#{Factorial.fac1(5)}")
