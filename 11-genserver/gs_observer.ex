defmodule GsObservable do
  use GenServer
  @spec create(integer()) :: pid()
   def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "amount can´t be negative"}
      true -> GenServer.start_link(__MODULE__, {initial_state, []})
     end
    end

    def init(state), do: {:ok, state}
    def read(subject), do: GenServer.call(subject, :read)
    def increment(subject), do: GenServer.cast(subject, :increment)
    def decrement(subject), do: GenServer.cast(subject, :decrement)
    def attach(subject), do: GenServer.cast(subject, {:attach, self()}) # función agregar observer
    def detach(subject), do: GenServer.call(subject, :detach) # función remover bserver


    def handle_call(:read, _from_id, {state, observers}) do
       {:reply, state, {state, observers}} # handle call remove observer

    end
    def handle_call(:detach, _from_id, {nil, []}), do: {:reply, {nil, []}} # handle call remover observer

    def handle_cast(:increment, {state, observers}) do
      state = state + 1
      {:noreply, {state, observers}}
     end

     def handle_cast(:decrement,  {state, observers}) do
      state = state - 1
      {:noreply,  {state, observers}}
    end

    def handle_cast({:attach, observer_id}, {state, observers}) do
      {:noreply, {state, observers ++ [observer_id]}}
    end

    def await(millis \\ 1000) do
      receive do
        count -> count
      after
        millis -> :timeout
      end
    end
  end
