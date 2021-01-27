result=cond do
  2+3==4->"2 + 3 ==4"
  2*3==4->"2 * 3 ==4"
  1+1==2->"1 + 1 ==2"
end
IO.puts result
result=cond do
  2+3==4->"2 + 3 ==4"
  2*3==4->"2 * 3 ==4"
  1+2==2->"1 + 2 ==2"
  true->nil #Needed when the rest of cases are false
end
IO.puts result


result=cond do
  hd([2,"hola",:ok])->"2 works as true"
end
IO.puts result
result=cond do
  hd([0,"hola",:ok])->"0 works as true"
end
IO.puts result

result=cond do
  hd(["hola",0,:ok])->"\"hola\" works as true"
end
IO.puts result

result=cond do
  hd([:ok,"",0])->" :ok works as true"
end
IO.puts result

result=cond do
  hd([:error,"",0])->" :error works as true"
end
IO.puts result

result=cond do
  hd([true,"",0])->" true works as true"
end
IO.puts result

result=cond do
  hd([false,"",0])->" false works as true"
  true->"false works como un false"
end
IO.puts result

result=cond do
  hd([false,"",0])==false->" false==false works as true"
end
IO.puts result
