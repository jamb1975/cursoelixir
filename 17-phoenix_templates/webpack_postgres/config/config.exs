# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :webpack_postgres,
  ecto_repos: [WebpackPostgres.Repo]

# Configures the endpoint
config :webpack_postgres, WebpackPostgresWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gObTNopwsRifcjkzAofhPahM0VzcGJUJ7b8f8k6CIIL9WBbwjc6ZGxB0Zd/rT6cI",
  render_errors: [view: WebpackPostgresWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WebpackPostgres.PubSub,
  live_view: [signing_salt: "Qle+QjSv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
