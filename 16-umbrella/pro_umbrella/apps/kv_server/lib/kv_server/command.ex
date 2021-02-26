defmodule KVServer.Command do
  #def run(command)
  #    {:ok, "OK\r\n"}
  # end
  def run(:create) do
    {:ok, supid} = GenServerObserver.Supervisor.start_link([])
    {:ok, "#{inspect(supid)}\r\n"}
  end

  def run(:read) do
    #[{_, subject, _, _}] = Supervisor.which_children(suppid)
    value = GenServerObserver.read(GenServerObserver)
    {:ok, "#{value}\r\n"}
  end

  def run({:increment, vincre}) do
    value = GenServerObserver.increment(GenServerObserver, vincre)
    {:ok, "#{value}\r\n"}
  end

  def run({:decrement, vdecre}) do
    value = GenServerObserver.decrement(GenServerObserver, vdecre)
    {:ok, "#{value}\r\n"}
  end

  def run(_), do: {:ok, "UNKNOWN COMMAND\r\n"}

  def parse(line) do
    case String.split(line) do
      ["C"] -> {:ok, :create}
      ["R"] -> {:ok, :read}
      ["I", vincre] -> {:ok, {:increment, String.to_integer(vincre)}}
      ["D", vdecre] -> {:ok, {:decrement, String.to_integer(vdecre)}}
      ["ERR"] -> {:error, :unknown_command}
       _ -> {:error, :invalid}
    end
  end
end
