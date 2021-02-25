defmodule KVServer do
  require Logger

  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info("Aceptando conexiones en el puerto, #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    Task.start_link(fn -> serve(client) end)
    loop_acceptor(socket)
  end

  defp serve(socket) do
    msg = case read_line(socket) do
      {:ok, data} -> case KVServer.Command.parse(data) do
      {:ok, command} -> KVServer.Command.run(command)
      {:error, _} = err -> err
      end
      {:error, _} = err -> err
    end
     write_line(msg, socket)
     serve(socket)
  end

  defp read_line(socket) do
    :gen_tcp.recv(socket, 0)
    #{:ok, data} = :gen_tcp.recv(socket, 0)
    #Logger.info("Se recibio: #{data}")
  end

  defp write_line({:ok, line}, socket) do
    :gen_tcp.send(socket, "Respuesta: #{line}")
  end

  defp write_line({:error, :close}, _socket) do
    exit(:shutdown)
  end

  defp write_line({:error, :unknow_command}, socket) do
    :gen_tcp.send(socket, "UNKNOW COMMAND\r\n")
  end

  defp write_line({:error, err}, socket) do
    :gen_tcp.send(socket, "ERROR\r\n")
    exit(err)
  end
  def inicio() do
  {:ok, subject}  =  GenServerObserver.create()
  subject |> IO.inspect()
  GenServerObserver.await |> IO.inspect()
  GenServerObserver.attach(subject) |> IO.inspect()
  GenServerObserver.detach(subject)
  GenServerObserver.increment(subject)
  GenServerObserver.await |> IO.inspect()
  GenServerObserver.attach(subject) |> IO.inspect()
  GenServerObserver.increment(subject)
  GenServerObserver.await |> IO.inspect()
  GenServerObserver.decrement(subject)
  GenServerObserver.await |> IO.inspect()
  end
end
