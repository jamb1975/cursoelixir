defmodule Mongoprueba.MixProject do
  use Mix.Project

  def project do
    [
      app: :mongoprueba,
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
      mod: {Mongoprueba.Application, []},
      applications: [:mongodb, :poolboy]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     # {:mongodb, "~> 0.5.1"},
     {:mongodb, git: "https://github.com/kobil-systems/mongodb.git"},
      {:poolboy, ">= 0.0.0"}
    ]
  end
end
