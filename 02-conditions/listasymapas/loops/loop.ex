defmodule Zero do
  def is_zero(0) do
    true
  end
  def is_zero(n) when is_integer(n) do
    true
  end

end


defmodule Loop do
  #int i=0;
  #while(true){
  #unless(i < n) break:
  # print (value)
  #i++
  #}
  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i+1, n, value)
        true->
          :ok
    end
  end
  def for_loop1(i, n, value) when i< n do

        IO.puts("#{value} #{i}")
        for_loop(i+1, n, value)
  end
    -

#def do_while(i, n, value) when i < n do
#  IO.puts("#{value} #{i}")
 # do_while(i+1,n,value)
#end


 #int i=0;
  #while(true){
  # print (value)
  #i++
  #if(i==n){
  #break
  #}
  #}

def do_while2(i, n, value)  do
  IO.puts :ok
end
def do_while3(i, n, value)  do
  cond do
  i < n->
  IO.puts("#{value} #{i}")
  do_while3(i+1,n,value)
  true->:ok
end
end

end
Loop.for_loop(1,3,"Valor")
Loop.do_while3(1,3,"Valor")
Loop.do_while2(1,3,"Valor")
