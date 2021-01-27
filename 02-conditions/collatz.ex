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

    #defp facp1(0,acc) when is_integer(acc) do
    #  acc
    #end
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
    def evaluateparimpa(x)  do
        cond do
        rem(x,2)==0-> div(x,2)
        true->x*3+1
      end
    end
  end


  IO.puts Collatz.classic(6)
  #IO.puts("fcollatz1(0) =#{Collatz.fcollatz1(0)}")
  #IO.puts("fcollatz1(1) =#{Collatz.fcollatz1(1)}")
  #IO.puts("fcollatz1(2) =#{Collatz.fcollatz1(2)}")
  #IO.puts("fcollatz1(3) =#{Collatz.fcollatz1(3)}")
  #IO.puts("fcollatz1(4) =#{Collatz.fcollatz1(4)}")
  #IO.puts("fcollatz1(5) =#{Collatz.fcollatz1(5)}")
