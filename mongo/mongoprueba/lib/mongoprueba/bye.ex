defmodule Bye do
    def bye(proceso) do
        Node.spawn_link(proceso, fn ->
            receive do
              {:hi, client}  -> send(client, :bye)
            end
        end) 
    end
end   

 # iex --sname hello -S mix 