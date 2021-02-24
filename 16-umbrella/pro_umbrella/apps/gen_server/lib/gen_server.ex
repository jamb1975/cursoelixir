defmodule GENServer do
  
    use GenServer
    @spec create(integer()) :: pid()
     def create(initial_state \\ 0) do
      cond do
        initial_state < 0 -> {:error, "amount can´t be negative"}
        true -> GenServer.start_link(__MODULE__, {initial_state, []})
       end
      end
  
      def init(state), do: {:ok, state}
      def read(subject), do:  send(subject, {:read, subject})#GenServer.call(subject, :read)
      def increment(subject), do: GenServer.cast(subject, :increment)
      def decrement(subject), do: GenServer.cast(subject, :decrement)
      def attach(subject), do: GenServer.call(subject, {:attach, self()}) # función agregar observer
      def detach(subject), do: GenServer.call(subject, :detach) # función remover bserver
      def notify(observers, state)  do
       # IO.inspect observers
        observers |> Enum.each(&send(&1, state))
        {observers, state}
      end  
      
  
      # def handle_call(:read, from_id, {state, observers}) do
      #   send from_id, {:state, state}
      #   {:reply, state, {state, observers}}
      # end
      def handle_call(:detach, _from_id, {state, _}), do: {:reply, state, {state, []}} # handle call remover observer
  
      def handle_cast(:increment, {state, observers}) do
        state = state + 1
        notify(observers, state)
        {:noreply, {state, observers}}
        raise "Error Sum"
       end
  
       def handle_cast(:decrement,  {state, observers}) do
        state = state - 1
        notify(observers, state)
        {:noreply,  {state, observers}}
       end
  
      def handle_call({:attach, observer_id}, _from_id, {state, observers}) do
     # notify(observers,state)
        observers = observers ++ [observer_id]
        {:reply, state, {state,observers}}
      end
  
      def await(millis \\ 1000) do
        receive do
          count -> count
        after
          millis -> :timeout
        end
      end
    end
  
  # {:ok, subject}  = GenServer.create()
  # subject |> IO.inspect()
  # GenServer.await |> IO.inspect()
  # GenServer.attach(subject) |> IO.inspect()
  # GenServer.detach(subject)
  # GenServer.increment(subject)
  # GenServer.await |> IO.inspect()
  # GenServer.attach(subject) |> IO.inspect()
  # GenServer.increment(subject)
  # GenServer.await |> IO.inspect()
  # GenServer.decrement(subject)
  # GenServer.await |> IO.inspect()
