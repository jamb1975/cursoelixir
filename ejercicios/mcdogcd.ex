defmodule McdGcd do
def classic(a, b) when is_integer(a)  and is_integer(b)  and a >= 0 and b>=0 do
  #cond do
    #n=0=1 -> 1# si es uno el proceso termina en 1
  #  true->
    fmcdgcd(a, b) # call function privada facp1
  # end
end
defp   fmcdgcd(a, b)  do
    cond do
    b == 0 -> a
    b > a -> fmcdgcd(b, a)
    true-> fmcdgcd(a - b, b)
  end
end
end
IO.puts McdGcd.classic(8,12)
