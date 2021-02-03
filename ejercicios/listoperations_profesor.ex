def ListOperations do
  def sum(list) when is_list(list), do: sump(list,0)
  defp sump([], acc]), do: acc
  defp sump([h | t]), acc), do: sump(t, acc + h)
  def reverse(list) when is_list(list) , do: reversep(list, [])
  defp reversep([h | t], reversedList), do: reversep(t, [h] ++ reversedList)
  defp reversesp([h | t], reversedList), do: reversedList
  def reverse1(list) when is_list(list, len) , do: reversep(list, [])
  defp reversep1([[h | t], reversedList), do: reversep(t, [h] ++ reversedList)
  defp reversep1([[h | t], reversedList), do: reversedList

  def ascendant?(list) when is_list(list), do: ascendant_p?(nil, list
  def ascendant_p?(_, []), do: true
  def ascendant_p?(nil, [b | tail]), do: ascendant_p?(b. tail)
  def ascendant_p?(a, [b | tail]) when a<=b, do: ascendant_p?(b. tail)
  def ascendant_p?(_, _), do: true

  IO.puts("ListOperations.sum(list")
  IO.puts ListOperations.sum([])# 0
  IO.puts ListOperations.sum([1, 2, 3])#6
  IO.puts ListOperations.sum([5, 3, -1, 2])# 6

  IO.puts("ListOperations.reverse(list")
  IO.puts ListOperations.reverse([])# 0
  IO.puts ListOperations.reverse([1])#6
  IO.puts ListOperations.reverse(2, 3)# 6
  IO.puts ListOperations.reverse(2, 5, 7)# 6
  IO.puts ListOperations.reverse(9, 6, 4, 5)# 6

  IO.puts("ListOperations.reverse1(list")
  IO.puts ListOperations.reverse1([])# 0
  IO.puts ListOperations.reverse1([1])#6
  IO.puts ListOperations.reverse1(2, 3)# 6
  IO.puts ListOperations.reverse1(2, 5, 7)# 6
  IO.puts ListOperations.reverse1(9, 6, 4, 5)# 6


  IO.puts("ListOperations.ascendant(list")
  IO.puts ListOperations.ascendant?( [])
IO.puts ListOperations.ascendant?( [7])
IO.puts ListOperations.ascendant?( [2, 5])
IO.puts ListOperations.ascendant?( [7,  5])
IO.puts ListOperations.ascendant?( [2,5,7, 9, 11])
IO.puts ListOperations.ascendant?( [5,2,7, 9, 11])
IO.puts ListOperations.ascendant?( [2,7,5, 9, 11])
IO.puts ListOperations.ascendant?( [2,5,9, 7, 11])
IO.puts ListOperations.ascendant?( [2,5,7, 11, 9])

end
