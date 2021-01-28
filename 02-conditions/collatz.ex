defmodule Collatz do
  def classic(n) when is_integer(n) and n>0 do
    #cond do
      #n==1 -> 1# si es uno el proceso termina en 1
    #  true->
      fcollatzp1(n) # call function privada facp1
   # end
  end
  defp fcollatzp1(n)  do
    IO.puts "#{n}"
    cond do
      n==1-> :ok
      rem(n,2)==0-> fcollatzp1(div(n,2))
      true-> fcollatzp1(n*3+1)
    end
  end
end
IO.puts Collatz.classic(7)
