defmodule PrintInteger do
  def classic(n) when is_integer(n) and n>0 do
    #cond do
      #n=0=1 -> 1# si es uno el proceso termina en 1
    #  true->
      fprintintegerp(n,2,"1") # call function privada facp1
   # end
  end
  defp   fprintintegerp(n,i,s)  do
    IO.puts s
  #  IO.puts n
  #  IO.puts i
    cond do
     i>n-> :ok
      true -> fprintintegerp(n,i+1,fformatlinae(1,n,i,""))
    end
  end
  defp   fformatlinae( k,n, j, s )  do
   # IO.puts n
  #  IO.puts j
  #  IO.puts s
    cond do
      k > j -> s
      rem(k,2) > 0 -> fformatlinae(k + 1, n, j , s <> "1")
      rem(k,2) == 0 -> fformatlinae(k + 1, n, j , s <> "0")
    end
  end
end
PrintInteger.classic(10)
