defmodule GsObserver do
  use GenServer
  @spec create(integer()) :: pid()
   def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "amount can´t be negative"}
      true -> GenServer.start_link(__MODULE__,initial_state, [])
     end
    end

    def init(state), do: {:ok, state}
    def read(subject), do: GenServer.call(subject,{:increment,  0 })
    def increment(subject), do: GenServer.call(subject, {:increment})
    def decrement(subject), do: GenServer.call(subject, {:decrement})
    def attach(subject), do: GenServer.cast(subject, {:attach, self()}) # función agregar observer
    def detach(subject), do: GenServer.call(subject, :detach) # función remover bserver

    def handle_call(:dequeue, _from_id, state, [value | observers]) do
      {:reply, state,state, observers, observers}
    end
    def handle_call(:detach, _from_id, state, []), do: {:reply, nil, state, []} # handle call remover observer
    def handle_cast({:attach, observer_id}, state, observers) do
      {:noreply, state,state,  observers ++ [observer_id], observers}
    end

     def handle_call({:increment}, _from_id, state, observers) do
      state = state + 1
      {:reply, state, state, observers, observers}
     end

     def handle_call({:decrement}, _from_id,  state, observers) do
      state = state - 1
      {:reply, state, state, observers, observers}
    end
  end
