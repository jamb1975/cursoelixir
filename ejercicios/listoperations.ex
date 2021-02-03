defmodule ListOperations do
def sum( a  ) when is_list(a),  do: sump(a, 0, 0) # call function privada facp1
def reverse( a ) when is_list(a) , do: reversep(a, [], length(a))
def is_ascendant?( a ) when is_list(a) , do: is_ascendantp(a, 0, length(a))
defp sump( a, i, acc ) do

  cond do
    length(a)==0 ->0
    length(a) == i ->acc
    true -> sump(a,i+1,acc + Enum.at(a,i))
end
end
defp reversep(_, acc, size) when size < 1, do: acc
defp reversep(list, acc, size), do: reversep(list,acc ++ [Enum.at(list,size - 1)], size - 1)
defp is_ascendantp(list, acc, size) do
cond do
size<2 ->  if acc <= 0 do true
else
  false
end
Enum.at(list, size - 1) < Enum.at(list, size - 2) -> is_ascendantp(list, acc + 1, size - 1)
Enum.at(list, size - 1) > Enum.at(list, size - 2) -> is_ascendantp(list, acc + 0, size - 1)
Enum.at(list, size - 1) == Enum.at(list, size - 2) -> is_ascendantp(list, acc + 0, size - 1)
true->  true
end
end
end
sum1= &ListOperations.sum/1
IO.inspect sum1.([2, 5])
#IO.inspect sum1.()
IO.inspect ListOperations.sum( [])
IO.inspect ListOperations.sum( [7])
IO.inspect ListOperations.sum( [2, 5])
IO.inspect ListOperations.sum( [7,  5])
IO.inspect ListOperations.sum( [2,5,7, 9, 11])
IO.puts "==================================================="
IO.inspect ListOperations.reverse( [])
IO.inspect ListOperations.reverse( [7])
IO.inspect ListOperations.reverse( [2, 5])
IO.inspect ListOperations.reverse( [7,  5])
IO.inspect ListOperations.reverse( [2,5,7, 9, 11])

IO.puts "=================================================="
IO.inspect ListOperations.is_ascendant?( [])
IO.inspect ListOperations.is_ascendant?( [7])
IO.inspect ListOperations.is_ascendant?( [2, 5])
IO.inspect ListOperations.is_ascendant?( [7,  5])
IO.inspect ListOperations.is_ascendant?( [2,5,7, 9, 11])
IO.inspect ListOperations.is_ascendant?( [5,2,7, 9, 11])
IO.inspect ListOperations.is_ascendant?( [2,7,5, 9, 11])
IO.inspect ListOperations.is_ascendant?( [2,5,9, 7, 11])
IO.inspect ListOperations.is_ascendant?( [2,5,7, 11, 9])
