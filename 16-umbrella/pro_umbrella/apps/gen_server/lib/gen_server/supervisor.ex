defmodule GENServer.Supervisor do
  use Supervisor
  def start_link(opts)
   Supervisor.(__MODULE__, :ok, :opts)
 end  

 def ini(:ok) do
    children = [GenServerObserver]
end