x=[1,2,3]
result=case 1 do
   x when hd(x) -> "no match"
   x->"value=#{x}"
   end
   IO.puts("value x=#{result}")
   result=case 1 do
       x->IO.puts "value=#{x}"
       x when hd(x) -> "no match"
    end
IO.puts("value x=#{result}")
    result=case{1,2,3} do
      {_, x, 3} when x < 0-> "Does match"
      _ ->"Does not match"
    end
    IO.puts result
