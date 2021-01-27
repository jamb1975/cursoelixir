#simple variable
x=5
y=case 10 do
  ^x-> "The value match with #{x}"
 _ ->"The value does not match with #{x}"
end
IO.puts y
#tuples
{:ok,result}=case{1,"hello",:ok} do
  {1, x, _}->{:ok,x}
  _ -> {:error, "There is not match"}
end

IO.puts result
IO.inspect {:ok,x}
