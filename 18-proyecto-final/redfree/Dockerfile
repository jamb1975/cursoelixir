FROM kranfix/phoenix_dev:1.0.0

WORKDIR /app

COPY . /app
RUN mix local.rebar --force
RUN mix deps.get && mix compile


CMD mix ecto.create && mix ecto.migrate && mix phx.server

 