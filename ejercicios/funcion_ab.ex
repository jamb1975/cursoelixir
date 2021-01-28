defmodule FuncionAb do
  def classic(a,b) when is_integer(a) and is_integer(b)  and a>=0 and b>=0 do
    #cond do
      #n=0=1 -> 1# si es uno el proceso termina en 1
    #  true->
      ffuncionabp(a,b) # call function privada facp1
   # end
  end
  defp   ffuncionabp(a,b)  do
    cond do
      a == 0 or b==0-> 0
      a == b -> ffuncionabp(a-1, b-1) + (2*a-1)
      a > b ->  ffuncionabp(a-b, b) + ffuncionabp(b, b)
      a < b ->  ffuncionabp(a, a) + ffuncionabp(b - a, a)
      true ->0
    end
  end
end
IO.puts FuncionAb.classic(10,5)
