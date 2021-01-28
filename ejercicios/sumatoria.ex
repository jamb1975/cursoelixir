defmodule Sumatoria do
  def classic(n) when is_integer(n) and n>0 do
    #cond do
      #n=0=1 -> 1# si es uno el proceso termina en 1
    #  true->
      fsumatoriap(n,1,0) # call function privada facp1
   # end
  end
  defp   fsumatoriap(n,i,acum)  do
    IO.puts "#{i}+#{acum}=#{acum}"
    cond do
      i>n-> acum
      true-> fsumatoriap(n,i+1,acum+i)
    end
  end
end
Sumatoria.classic(10)
