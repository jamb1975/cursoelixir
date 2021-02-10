defmodule ObservableGenServer do
  use GenServer
  @enforce_keys :value
  defstruct [:value, observers: []]
  def create(initial_value \\ 0) do
      state = %ObservableGenServer{value: initial_value}
      GenServer.start_link(__MODULE__, state)

    end

    def init(state), do: {:ok, state}
    defp add_observer(observers, observer_pid), do: [observer_pid | observers]
    defp remove_observer(observers, observer_pid), do: observers -- [observer_pid]
    defp notify(state), do: state.observers |> Enum.each(&send(&1, state.value))

    def attach(subject), do: GenServer.cast(subject, {:attach, self()}) # función agregar observer
    def detach(subject), do: GenServer.call(subject, :detach) # función remover bserver


    def read(subject), do: GenServer.call(subject, :read)

    def handle_call(:read, _reader_id, state), do: {:reply, state.value, state} # handle call remover observer

    def handle_call(:detach, {observer_pid, _}, state) do
      news_observers = state.observers |> remove_observer(observer_pid)
      {:reply, :ok, Map.put(state, :observers, news_observers)} # handle call remover observer
    end
    def handle_call(:attach, {observer_pid, _}, state) do
      news_observers = state.observers |> add_observer(observer_pid)
      {:reply, :ok, Map.put(state, :observers, news_observers)} # handle call remover observer
    end
    def handle_cast(:increment, state) do
      state = Map.put(state, :value, state.value + 1)
      notify(state)

      {:noreply, state}
    end
    def handle_cast(:decrement, state) do
      state = Map.put(state, :value, state.value - 1)
      notify(state)
     {:noreply, state}
    end

    def increment(subject), do: GenServer.call(subject, {:increment})
    def decrement(subject), do: GenServer.call(subject, {:decrement})

    def await(millis \\ 1000) do
      receive do
        count -> count
      after
        millis -> :timeout
      end
    end
  end
