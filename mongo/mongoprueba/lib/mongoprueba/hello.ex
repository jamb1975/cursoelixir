defmodule Hello do
  def hello do
    IO.puts(" hola")
  end
end      
# iex.bat  --sname hola
# iex(hola@PSLT3913)1> defmodule Hello do
# ...(hola@PSLT3913)1>   def hello do
# ...(hola@PSLT3913)1>    IO.puts "algo"
# ...(hola@PSLT3913)1>   end
# ...(hola@PSLT3913)1> end

# pid = Node.spawn_link(:"hola@PSLT3913", fn ->
#                       receive do
#                         {:hi, client}  -> send(client, :bye)
#                       end
#                     end) 

#                     iex(chao@PSLT3913)1> send(pid, {:hi, self()}) 
#                     iex(chao@PSLT3913)1>   flush()
 
#                  iex(bye@PSLT3913)1> pid = Node.spawn_link(:"hola@PSLT3913", fn ->
#                                                                              receive do
#                                                                                {:hi, client}  -> send(client, :bye)
#                                                                               end
#  iex --sname hello -S mix                                                                           end) 
#  iex --sname bye -S mix
