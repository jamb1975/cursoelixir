defmodule FObs do
  @spec create(integer()) :: pid()
  def create(initialstate \\ 0) do
    spawn(__MODULE__, :listen, [[], initialstate])
  end

  def listen(observers, state) do
    receive do
      event ->
        {observers, state} = on_event(event, observers, state)
        listen(observers, state)
        end
    end

    def add_observer(observers, observer_pid), do: [observer_pid | observers]
    def remove_observer(observers, observer_pid), do: observers -- [observer_pid]
    def notify(observers, state) do
     #"Enum.each(observers, fn(obs_id) -> send(obs_id, state end)
     #"observers |> Enum.each(fn(obs_id) -> send(obs_id, state end)
     observers |> Enum.each(&send(&1, state))
     {observers, state}
    end
    def attach(subject), do: send(subject, {:attach, self()})
    def detach(subject), do: send(subject, {:detach, self()})

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
def on_event({:attach, observer_pid}, observers, state) do
  observers |> add_observer(observer_pid) |> listen(state)
end
def on_event({:detach, observer_pid}, observers, state) do
  observers |> remove_observer(observer_pid) |> listen(state)
end
def on_event({:read, observer_pid}, observers, state) do
  send(observer_pid, state)
  listen(observers, state)
end

def increment(subject), do: send(subject, {:increment})
def decrement(subject), do: send(subject, {:decrement})

def on_event({:increment}, observers, state), do: notify(observers, state + 1)
def on_event({:decrement}, observers, state), do: notify(observers, state - 1)



end

subject=FObs.create()

IO.inspect(FObs.read(subject))

FObs.attach(subject)

FObs.increment(subject)
IO.puts(FObs.await())

FObs.increment(subject)
IO.puts(FObs.await())

FObs.decrement(subject)
IO.puts(FObs.await())

FObs.increment(subject)
IO.puts(FObs.await())

FObs.detach(subject)
FObs.increment(subject)
IO.puts(FObs.await())
