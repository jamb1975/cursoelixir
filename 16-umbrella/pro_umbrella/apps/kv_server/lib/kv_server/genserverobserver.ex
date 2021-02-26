defmodule GenServerObserver do

    use GenServer
    @spec create(integer()) :: pid()
     def create(initial_state \\ 0) do
      cond do
        initial_state < 0 -> {:error, "amount can´t be negative"}
        true -> GenServer.start_link(__MODULE__, {initial_state, []})
       end
      end

      def start_link(opts), do: GenServer.start_link(__MODULE__, {0, []}, opts)

      def init(state), do: {:ok, state}

      def read(gso), do:  GenServer.call(gso, :read)#GenServerObserver.call(gso, :read)

      def attach(subject), do: GenServer.call(subject, {:attach, self()}) # función agregar observer

      def detach(subject), do: GenServer.call(subject, :detach) # función remover bserver

      def increment(subject, vincre), do: GenServer.cast(subject, {:increment, vincre})

      def decrement(subject, vdecre), do: GenServer.cast(subject, {:decrement, vdecre})

      def notify(observers, state)  do
       # IO.inspect observers
        observers |> Enum.each(&send(&1, state))
        {observers, state}
      end


       def handle_call(:read, _from_id, {state, observers}), do: {:reply, state, {state, observers}}

       def handle_call(:detach, _from_id, {state, _}), do: {:reply, state, {state, []}} # handle call remover observer

       def handle_call({:attach, observer_id}, _from_id, {state, observers}) do
        # notify(observers,state)
        observers = observers ++ [observer_id]
        {:reply, state, {state,observers}}
       end

      def handle_cast({:increment, vincre}, {state, observers}) do
        state = state + vincre
        notify(observers, state)
        {:noreply, {state, observers}}
         #raise "Error Sum"
      end

       def handle_cast({:decrement, vdecre},  {state, observers}) do
        state = state - vdecre
        notify(observers, state)
        {:noreply,  {state, observers}}
       end

      def await(millis \\ 1000) do
        receive do
          count -> count
        after
          millis -> :timeout
        end
      end
    end

  # {:ok, subject}  =  KVServer.GenServerObserverr.create()
  # subject |> IO.inspect()
  # GenServerObserver.await |> IO.inspect()
  # GenServerObserver.attach(subject) |> IO.inspect()
  # GenServerObserver.detach(subject)
  # GenServerObserver.increment(subject)
  # GenServerObserver.await |> IO.inspect()
  # GenServerObserver.attach(subject) |> IO.inspect()
  # GenServerObserver.increment(subject)
  # GenServerObserver.await |> IO.inspect()
  # GenServerObserver.decrement(subject)
  # GenServerObserver.await |> IO.inspect()
  # {:ok, suppid} = GenServerObserver.Supervisor.start_link([])
  # [{_, subject, _, _}] = Supervisor.which_children(suppid)
