defmodule Redfree.Repo do
  use Ecto.Repo,
    otp_app: :redfree,
    adapter: Ecto.Adapters.Postgres
end
