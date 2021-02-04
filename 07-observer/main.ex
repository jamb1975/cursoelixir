defmodule Observable do
  @spec create(integer()) :: pid()
  def create(initialstate \\ 0) do
    spawn(__MODULE__, :listen, [[], initialstate])
  end

  def listen(observers, state) do
    receive do
      {:attach, observer_pid} ->
      #new_observers=add_observer(observers, observer_pid)
      #listen(new_observers, state)
        observers |> add_observer(observer_pid) |> listen(state)
      {:detach, observer_pid} ->
        #new_observers=remove_observer(observers, observer_pid)
        #listen(new_observers, state)
         observers |> remove_observer(observer_pid) |> listen(state)
      {:increment} ->
        state = state + 1
        notify(observers, state)
        listen(observers, state)
      {:decrement} ->
          state = state - 1
          notify(observers, state)
          listen(observers, state)
      {:read, reader_pid} ->
          send(reader_pid, state)
          listen(observers, state)
     end
  end

    def add_observer(observers, observer_pid), do: [observer_pid | observers]
    def remove_observer(observers, observer_pid), do: observers -- [observer_pid]
    def notify(observers, state) do
     #"Enum.each(observers, fn(obs_id) -> send(obs_id, state end)
     #"observers |> Enum.each(fn(obs_id) -> send(obs_id, state end)
     observers |> Enum.each(&send(&1, state))
    end
    def attach(subject), do: send(subject, {:attach, self()})
    def detach(subject), do: send(subject, {:detach, self()})
    def increment(subject), do: send(subject, {:increment})
    def decrement(subject), do: send(subject, {:decrement})

    def read(subject) do
      send(subject, {:read, self()})
      await()
    end
    def await(millis \\ 1000) do
      receive do
        count -> count
      after
        millis -> :timeout
      end
    end


end

subject=Observable.create()

IO.puts(Observable.read(subject))

Observable.attach(subject)

Observable.increment(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.decrement(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.detach(subject)
Observable.increment(subject)
IO.puts(Observable.await())
