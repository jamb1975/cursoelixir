defmodule Collatz do
  def classic(n) when is_integer(n) and n>0 do
    cond do
        n==1 -> 1# si es uno el proceso termina en 1
        true->fcollatz1(n) # call function privada facp1
      end
    end
    def fcollatz1(n) do
      fcollatzp1(n,1,1)
    end
    defp fcollatzp1(n,i,acc) when is_integer(n) do
      cond do
        i==n->acc  #cuando llegue a devuelve acumulado
        rem(n,2)==0->
          IO.puts "#{n}"
          fcollatzp1(div(n,2),i,1)
        true->
          IO.puts "#{n}"
          fcollatzp1(n*3+1,i,1)
      end
    end
  end
  IO.puts Collatz.classic(7)
