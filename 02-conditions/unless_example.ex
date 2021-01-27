result=unless false do
  "This is not shown"
end
IO.puts result
result=unless true do
  "This is not shown"
else
  "another value"
end
IO.puts result
evaluateunless=fn x->
  unless x do
    "Truhty"
  else
    "Falsy"
  end
end
IO.puts evaluateunless.(false)
IO.puts evaluateunless.(nil)

evaluateunless2=fn x->
  unless x, do: "Truhty", else: "Falsy"
  end

IO.puts evaluateunless2.(false)
IO.puts evaluateunless2.(nil)
