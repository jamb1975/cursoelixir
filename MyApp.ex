defmodule MyApp.Periodically do
    use GenServer
  
    def start_link(_) do
      GenServer.start_link(__MODULE__, %{})
    end
  
    @impl true
    def init(state) do
      # Schedule work to be performed on start
      schedule_work()
  
      {:ok, state}
    end
  
    @impl true
    def handle_info(:work, state) do
      # Do the desired work here
      # ...
  
      # Reschedule once more
      schedule_work()
  
      {:noreply, state}
    end
  
    defp schedule_work do
      # In 2 hours
      Process.send_after(self(), :work, 2 * 60 * 60 * 1000)
    end
  end
  MyApp.Periodically.start_link(0) |> IO.inspect()
  MyApp.Periodically.init(1) |> IO.inspect()