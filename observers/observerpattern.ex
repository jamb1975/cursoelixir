defmodule Observable do
  def start do
    spawn(__MODULE__, :listen, [[], 0])
  end

  def listen(subscribers, count) do
    receive do
      {:add_subscriber, subscriber_pid} ->
        add_subscriber(subscribers, subscriber_pid) |>
        listen(count)
      {:add_to_counter} ->
        new_count = count + 1
        notify_subscribers(subscribers, new_count)
        listen(subscribers, new_count)
    end
  end

  def add_subscriber(subscribers, subscriber_pid) do
    [subscriber_pid | subscribers]
  end

  def notify_subscribers(subscribers, count) do
    Enum.each(subscribers, fn(subscriber_pid)->
      send(subscriber_pid, count)
    end)
  end
