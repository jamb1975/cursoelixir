############
result=case 1 do
  x when x<0->"No match"
  x->"Value #{x}"
end
IO.puts result
result=case -1 do
  x-> "Value = #{x}"
  x when x<0 -> "No match"
end
IO.puts result
result=case 1 do
  a-> "Value = #{a}"
  _ -> "No match"
end
IO.puts result
