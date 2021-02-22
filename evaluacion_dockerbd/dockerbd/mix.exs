defmodule Dockerbd.MixProject do
  use Mix.Project

  def project do
    [
      app: :dockerbd,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Dockerbd.Application, []},
      #applications: [:httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:json, "~> 1.4"},
      {:ecto_sql, "~> 3.2"},
      {:postgrex, "~> 0.15"}
    ]
  end
end
