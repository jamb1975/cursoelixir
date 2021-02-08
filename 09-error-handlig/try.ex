IO.puts("SECTION 1 ------------------------")
try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  ArithmeticError -> IO.puts("The divisions was not possible")
end
  IO.puts("SECTION 2 ------------------------")
  try do
    :bar / 2
  rescue
    RuntimeError -> IO.puts("There was a runtime error")
     e in ArithmeticError -> IO.puts("The divisions was not possible #{e.message} ")
  end


  try do

    raise CustomeError, message: "My custom error", country: "Israel"
  rescue
   e in CustomeError -> IO.puts("message: #{e.message}, country: #{e.country}")
  end

  try do

    raise CustomeError, message: "My custom error"
  rescue
   e in CustomeError -> IO.puts("message: #{e.message}, country: #{e.country}")
  end

  #############################################
  try do

    raise "There was an error  :'("
  rescue
  _ -> IO.puts("This is always printed on error")
  after
    IO.puts("This is always printed")
  end


  ######################################
  try do

  IO.puts("this es")
  catch
  e -> IO.puts("This is a catch#{e}")
  after
    IO.puts("This is always printed")
  end

  try do

    throw(453_637)
    IO.puts("This is always printed")
    catch
    e -> IO.puts("This is a catch #{e}")
    after
      IO.puts("This is always printed")
    end


    try do
       throw("hola")
       IO.puts("This is never printed")

    rescue
      e -> IO.puts(" From rescue:  #{e.message}")
    catch
      e -> IO.puts(" From catch:  #{e}")
    after
      IO.puts("This is always printed")
    end

    try do
      throw(nil)
      IO.puts("This is never printed")

   rescue
     e -> IO.puts(" From rescue:  #{e.message}")
   catch
     e -> IO.puts(" From catch:  #{e}")
   after
     IO.puts("This is always printed")
   end

 ###############################################
   try do
    0..20
    |>Enum.each(fn x ->
      if x== 10, do: throw("Oops!")
    end)

 rescue
   e -> IO.puts(" From rescue:  #{e.message}")
 catch
   e -> IO.puts(" From catch:  #{e}")
 after
   IO.puts("This is always printed")
 end
try do
  0..20
  |> Enum.each(fn x->
    if x == 10, do: throw("Oops")
  end)
rescue
  e -> IO.puts("From recue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
  IO.puts("This is always printed")
end


 sum = try do
  1..20 |> Enum.reduce(0, fn h, acc ->
     if(rem(h, 13) == 0) do
      throw acc
     else
      h + acc
     end
    end)
  catch
    acc -> acc
end
IO.puts sum

######elseif

how_large_is = fn x ->
  try do
   1 / x
   rescue
    ArithmeticError -> :infinity
  #catch
    #e -> IO.puts e
   else
    d when d < 1 and d > -1 -> :small
    d when d < 10 and d > -10 -> :middle
  _ -> :large
   after
    IO.puts "hello"

  end
end
#how_large_is.(0)
IO.puts how_large_is.(1)
IO.puts how_large_is.(2)
IO.puts how_large_is.(0.5)
IO.puts how_large_is.(0.1)

a = spawn_link fn ->
   receive do
    msg -> IO.puts(msg)
  end
end
IO.puts Process.alive?(a) #true

send a, "Hello"
IO.puts Process.alive?(a) #false

a = spawn_link fn ->
  exit(1)
  receive do
    msg -> IO.puts(msg)
  end
end
IO.puts Process.alive?(a)
