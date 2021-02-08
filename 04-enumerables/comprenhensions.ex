list = for n <- [1, 2, 3, 4], do: n * n
IO.inspect list
#Reading x
x = 3 #this will not be updated
list = for n <- [1, 2, 3, 4], do: n + x
IO.inspect list #[1, 2, 3, 4] (as charlist)
#Updating x ?
list = for n <- [1, 2, 3, 4], do: n + x
IO.inspect list #[4, 5, 6, 7]

##keyword list
values =[good: 1, good: 5, bad: -1, good: 7]
list = for {:good, n} <- values, do: n * n
IO.inspect(list) #[1, 25, 49])
##,
values = [1, 3, 2, 6, 5, 9, 8, 24, 20]
even? = &(rem(&1, 2)==0)
list = for n <- values, even?.(n), do: n * n
IO.inspect list

##
letters = [:x, :y, :z]
numbers = [1, 2, 3, 4]
for l1 <- letters, n <- numbers, do: {l1, n}
#IO.inspect l

evens = [0, 2, 4,6, 8, 10, 12]
mod3_numbers = [0, 3, 6, 9, 12, 15, 18]
for _ <- evens, x, n <- mod3_numbers, do: n

IO.inspect list

##
values = [[1, 2], [], [4, 5] ]
list = for list <- values,
n <- list do
  n
end
IO.inspect list
File.ls!("./")
#File.ls!("./unknown") #could not list directory ".unkanow
dirs =[

  "./",
  "../03-loops"
]
for dir <- dirs,
file <- File.ls!(dir),
path = Path.join(dir, file),
File.regular?(path) do
File.stat!(path).size
end

##
pixels = "hello world!"
IO. inspect for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}

pixels = "hello world"
IO. inspect for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}

pixels = "hello world!!"
IO. inspect for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}

##
map = %{"a" => 1, "b" => 2, "c" => 3}
list =  for {k, v} <- map, do: {k, v + 1}
IO.inspect list #[{"a", 2}, {"b", 3}, {"c", 3}]

increment_map =  for {k, v} <- map, into: %{}, do: {k, v + 1}
IO.inspect increment_map #%["a" => 2, "b" => 3, "c" => 4]

list = [1, 2, 1, 3, 4, 2, 5]
listu = for n <- list, uniq: true, do: n + 3
 IO.inspect listu #[4, 5, 6, 7, 8]
#
text = "AbcaBCabC"
letters = for<<c <- text>>, c in ?a..?z, do: <<c>>
IO.inspect letters
letters= Enum.reduce(letters, %{}, fn c, acc -> Map.update(acc, c, 64, &(&1 + 1))end)

IO.inspect letters
text = "AbcaBCabC"
letters = for<<c <- text>>, c in ?a..?z, reduce: %{} do
   acc -> Map.update(acc, <<c>>, 64, &(&1 + 1))
end
IO.inspect letters
