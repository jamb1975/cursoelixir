#defmodule Factorial do
 # def fac(n) do
 #   cond do

 #       n>1->n * fac(n-1)
  #      n>=0->1
  #      true->1 #Needed when the rest of cases are false
  #    end
  #  end
 # end

  defmodule Factorial2 do
    def classic(n) when is_integer(n) and n>=0 do
      cond do

          n < 2 -> 1

          true->facp1(n, 0, 1)
        end
      end
      def fac1(n) do
        facp1(n,1,0)
      end
      defp facp1(n,1,acc) when is_integer(n) do
        cond do
          i==n->acc
          true-> facp1(n, i+1,acc)
        end
      end
    end


IO.puts Factorial2.classic(0)
