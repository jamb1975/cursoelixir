defmodule KVServer.Command do
  #def run(command)
  #    {:ok, "OK\r\n"}
  # end
  def run(nil), do: {:ok, "OK\r\n"}

  def run(:create) do
    {:ok, supid} = GenServerObserver.Supervisor.start_link([])
    {:ok, "#{inspect(supid)}\r\n"}
  end

  def run(:read) do
    #[{_, subject, _, _}] = Supervisor.which_children(suppid)
    value = GenServerObserver.read(GenServerObserver)
    {:ok, "#{value}\r\n"}
  end

  def run(:increment) do
    value = GenServerObserver.increment(GenServerObserver)
    {:ok, "#{value}\r\n"}
  end

  def run(:decrement) do
    value = GenServerObserver.decrement(GenServerObserver)
    {:ok, "#{value}\r\n"}
  end

  def parse(line) do
    case String.split(line) do
      ["C"] -> {:ok, :create}
      ["R"] -> {:ok, :read}
      ["I"] -> {:ok, :increment}
      ["D"] -> {:ok, :decrement}
      ["ERR"] -> {:error, :unknown_command}
       _ -> {:ok, nil}
    end
  end
end
