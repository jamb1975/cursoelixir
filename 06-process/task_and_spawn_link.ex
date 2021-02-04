pid = spawn_link fn -> 1 + 2 end
IO.inspect pid
pid1 = spawn fn -> raise "Opps! Threre's an error" end #"lanza un nuevo proceso aislado"
IO.inspect pid1#procesos son muy faciles y livianos de implementa y puede manejar mile de procesos

#pid2 = spawn_link fn -> raise "Opps! Threre's an error"  #"lanza un nuevo proceso aislado"
#IO.inspect pid2

#Task
#Basd spawn
{:ok, pid} = Task.start fn -> 1 + 2 end
 IO.inspect pid #PID<0.101.0>
#TODO: raise an error inside the Task.start
#Task.start fn -; raise opps¡ end

#Basd spawn_link
{:ok, pid} = Task.start_link fn -> 1 + 2 end
 IO.inspect pid #PID<0.101.0>
#TODO: raise an error inside the Task.start
#Task.start fn -; raise opps¡ end
