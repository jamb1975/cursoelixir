defmodule Dockerbd.Repo do
  use Ecto.Repo,
    otp_app: :dockerbd,
    adapter: Ecto.Adapters.Postgres
end
