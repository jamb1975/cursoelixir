map=%{ :a =>5, 2=> "hello",true=>, :ok}
map=%{ :a =>5, 2=> "hello",2=>, :ok}#warning key
IO.puts "map = %{ 2 => \"map[2]\", a=>#{:a}, true=> #{map[true]}}"
map=%{ :a=5,2=>"hello", 2=>:ok}
IO.put map[:c]#nil
%{2=> b, :a=>a}=%{:a=> 5, 2=>true}
%{:a=> a, :a=>a}=%{:a=> 5, b=>2}# a=5
%{:c=> a, :a=>a}=%{:a=> 5, b=>2}#throws a Matcherror
%{}=%{:a=> 5, b=>2}#It works but is useless

key =5
map=%{:a=> true, :key=>"hello"}=%{:a=> 5, 2=>true}
IO.puts map[key]


#operations
map=%{:a=> true, :key=>"hello", true => :ok}
IO.puts Map.get(map, :a) #5
map2=Map.put(map, :c,4)
Io.puts (map2==map)
map3=Map.put(map2,:c,false)
Io.puts (map2==map3)
