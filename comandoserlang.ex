#:binary.bin_to_list  "hola mundo"
  # :erlang.+(2, 3)
  # 2 |> :erlang.+(3)
  # :io.format("pi es aproximado a: ~10.3f~n", [:math.pi])
  # :io_lib.format("pi es aproximado a: ~10.3f~n", [:math.pi])
  # Base.encode16(:crypto.hash(:sha256, "curso elixir"))
  # table = :ets.new :my_table, [] #Riesgo de problemas con la concurrencia no hay garantía de evitar condicionales de carrera
  # :ets.insert(table, {"Colombia", "COP"})
  #:ets.i(table)
 # :ets.stop(table)
 # :ets.lookup(table, "Colombia")
 # :math.pi()
 # &:math.pi/0
 #:math.pow(2, 3)
 #:rand.uniform()
 #:rand.seed(:exs1024, {47, 545,890})
 #:rand.uniform(7)
 #:rand.uniform(6) + :rand.uniform(6)
 #:rand.uniform(6) + :rand.uniform(6)

 ##############################################################################

 #h :zip.foldl(fn _, _, _, acc -> acc + 1 end, 0, :binary.bin_to_list("app.zip"))
#h :binary.bin_to_list
#  compressed = :zlib.compress parrafo
#  byte_size parrafo #395
#  byte_size compressed #164
#  :zlib.uncompress compressed # return bit stream
#  digraph = :digraph.new
#coords = [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
#  [vo, v1, v2] = (for x <- coords, do: :digraph.add_vertex(digraph, x))
# h :digraph.add_vertex
# :digraph.add_edge(digraph, v1, vo)
#digraph |> :digraph.add_edge(digraph, vo, v2)
# :digraph.get_short_path(digraph, v2, vo)
# :digraph.get_short_path(digraph, v1, v2)
# :digraph.get_short_path(digraph, v2, v1)
# :digraph.get_short_path(digraph, vo, v2)


#########################################################################

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

###################
{:ok, sup} = GENServer.Supervisor.start_link([])
