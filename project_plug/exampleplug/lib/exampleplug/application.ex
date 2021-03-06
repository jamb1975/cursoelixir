defmodule Exampleplug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger
  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Exampleplug.HelloWorldPlug, options: [port: 8090]}
    ]
  
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Exampleplug.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
