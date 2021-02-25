defmodule KVServer.Command do
  #def run(command)
  #    {:ok, "OK\r\n"}
  # end
  def run(nil), do: {:ok, "UNKNOWN COMMAND\r\n"}

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
    value = GenServerObserver.increment({GenServerObserver, String.to_integer(vincre)})
    {:ok, "#{value}\r\n"}
  end

  def run({:decrement, vdecre}) do
    value = GenServerObserver.decrement({GenServerObserver,String.to_integer(vdecre)})
    {:ok, "#{value}\r\n"}
  end

  def parse(line) do
    case String.split(line) do
      ["C"] -> {:ok, :create}
      ["R"] -> {:ok, :read}
      ["I", vincre] -> {:ok, {:increment, vincre}}
      ["D", vdecre] -> {:ok, {:decrement, vdecre}}
      ["ERR"] -> {:error, :unknown_command}
       _ -> {:ok, nil}
    end
  end
end
