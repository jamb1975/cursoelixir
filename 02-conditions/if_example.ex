result=if true do
  "This return a value"
end
IO.puts result #this return value

result=if false do
  "This return a value"
end
IO.puts result #this return value
evaluate=fn x->
  if x do
    "Thuhty"
  else
    "falsy"
  end

end
IO.puts evaluate.(false)
IO.puts evaluate.(nil)
IO.puts evaluate.(:ok)
IO.puts evaluate.(:error)

evaluate2=fn(x,y)->
  if x   do
    "Thuhty"
  else
    "falsy"
  end

end
IO.puts evaluate2.(false,true)
IO.puts evaluate2.(nil,false)
IO.puts evaluate2.(:ok,true)
IO.puts evaluate2.(:error,true)
if(true,[{:do, "Truhty"},{:else, "Falsy"}])
